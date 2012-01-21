unit hjLunarDateConverter;

interface

uses
  Windows, Classes, SysUtils, hjLunarDateType;

type
  ERangeError = class(Exception);

  ThjLunarDateConverter = class(TObject)
  private
    procedure RangeError(const Msg: string);
  protected
    procedure ValidateDate(ADate: TSolarDateRec); overload;
    procedure ValidateDate(ADate: TLunarDateRec); overload;
  public
    constructor Create;
    destructor Destroy; override;

    procedure test;

    function SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
    function LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;

    function GetLunarDaysOfMonth(AYear, AMonth: Word; AIsLeapMonth: Boolean): Word;

    function GetSupportSolarPriod: string;
    function GetSupportLunarPriod: string;
  end;

implementation

uses
  Math, DateUtils, CalendarCommons;

{$include LunarTableData.inc}


{ ThjLunarCalculator }

constructor ThjLunarDateConverter.Create;
begin

end;

destructor ThjLunarDateConverter.Destroy;
begin

  inherited;
end;

function ThjLunarDateConverter.GetSupportLunarPriod: string;
begin
  Result := Format('%s-1-1~%s-12-31)', [SupportYearStart, SupportYearEnd]);
end;

function ThjLunarDateConverter.GetSupportSolarPriod: string;
begin
  Result := SupportDateStartStr + '~' + SupportDateEndStr;
end;

procedure ThjLunarDateConverter.RangeError(const Msg: string);
  function ReturnAddr: Pointer;
  asm
    MOV     EAX,[EBP+4]
  end;
begin
  raise ERangeError.Create(Msg) at ReturnAddr;
end;

procedure ThjLunarDateConverter.ValidateDate(ADate: TSolarDateRec);
var
  ErrMsg: string;
begin
  ErrMsg := Format('유효범위를 벗어 났습니다.(양력지원 일자: %0:s~%1:s)', [SupportDateStartStr, SupportDateEndStr]);

  // ### 연도 범위 오류
  if ADate.Year < SupportYearStart then
    RangeError(ErrMsg);

  // 양력 지원 시작일 이전
  if (ADate.Year = SupportYearStart) and (ADate.Month = 1) and (ADate.Day <= StandardBetweenStart) then
    RangeError(ErrMsg); // INVALID_RANGE_START

  // 양력 지원 종료일 이후
  if (ADate.Year > SupportYearEnd) and ((ADate.Month > 1) or (ADate.Day > StandardBetweenEnd)) then
    RangeError(ErrMsg); // INVALID_RANGE_END

  // ### 월 범위 오류
  if (ADate.Month < 1) or (ADate.Month > 12) then
    RangeError(Format('''%0:d''월은 유효하지 않은 월입니다.', [ADate.Month]));

  // ### 일 범위 오류
  if (ADate.Day < 1) or (MonthDays[IsLeapYear(ADate.Year)][ADate.Month] < ADate.Day) then
    RangeError(Format('''%0:d''일은 유효하지 않은 일자입니다.', [ADate.Day]));
end;

procedure ThjLunarDateConverter.ValidateDate(ADate: TLunarDateRec);
var
  I: Integer;
  ErrMsg: string;
  MonthTable: string;
  MonthIndex: Integer;
  DaysOfMonth: Integer;
begin
  // ### 연도 범위 오류
  if (ADate.Year < SupportYearStart) or (ADate.Year > SupportYearEnd) then
  begin
    ErrMsg := Format('유효범위를 벗어 났습니다.(음력지원 일자: %0:d-01-01~%1:d-12-31)', [SupportYearStart, SupportYearEnd]);
    RangeError(ErrMsg);
  end;

  // ### 월 범위 오류
  if (ADate.Month < 1) or (ADate.Month > 12) then
    RangeError(Format('''%0:d''월은 유효하지 않은 월입니다.', [ADate.Month]));

  // ### 일 범위 오류
  if (ADate.Day < 1) then
    RangeError(Format('''%0:d''일은 유효하지 않은 일자입니다.', [ADate.Day]));

  // 대월 소월 검증
  MonthTable := LunarMonthTable[ADate.Year - SupportYearStart];
  MonthIndex := ADate.Month;
  for I := 1 to ADate.Month do
  begin
    if CharInSet(MonthTable[I], ['3', '4']) then
      Inc(MonthIndex);
  end;
  DaysOfMonth := IfThen(CharInSet(MonthTable[MonthIndex], ['1', '3']), 29, 30);
  if ADate.Day > DaysOfMonth then
    RangeError(Format('음력 ''%0:d년 %1:d월''은 ''%3:d일'' 까지 있습니다.(''%2:d일''은 유효하지 않습니다.)', [ADate.Year, ADate.Month, ADate.Day, DaysOfMonth]));

  // 윤달 검증
  MonthTable := LunarMonthTable[ADate.Year - SupportYearStart];
  if ADate.IsLeapMonth and (not CharInSet(MonthTable[ADate.Month+1], ['3', '4'])) then
    RangeError(Format('음력 ''%0:d년 %1:d월''은 윤달이 아닙니다.', [ADate.Year, ADate.Month]));
end;

{===============================================================================
  # 음력일자를 양력일자로 변환하여 반환
  # Parameter
    ADate: TLunarDateRec : 변환 대상 음력일자(윤달여부 포함)
  # Return
    TSolarDateRec: 변환된 양력 일자
===============================================================================}
function ThjLunarDateConverter.LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;
  function GetDayCountFromYear(AYear: Word): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to AYear - SupportYearStart do
      Result := Result + LunarYearDays[I];
  end;

  function GetDayCountFromMonth(AYear, AMonth: Word; AIsLeap: Boolean): Integer;
  var
    I: Integer;
    MonthTable: string;
  begin
    Result := 0;
    MonthTable := LunarMonthTable[AYear - SupportYearStart];
    if AIsLeap then
      Inc(AMonth);
    for I := 1 to AMonth do
      Result := Result + IfThen(CharInSet(MonthTable[I], ['1', '3']), 29, 30);
  end;

var
  I: Integer;
  DayCount: Integer;
  DaysOfYear, DaysOfMonth: Integer;
begin
  try
    ValidateDate(ADate);
  except
    raise;
  end;

  ZeroMemory(@Result, SizeOf(Result));

  // ###### 양력일수 구하기 ######
  // [STEP 1] 음력> 기준년 부터 전년도까지의 연도별 일수 증가
  // [STEP 2] 음력> 전월까지 월별 일수 증가(윤달처리 포함)
  // [STEP 3] 음력> 일자 증가

  DayCount := 0;
  // STEP 1
  DayCount := DayCount + GetDayCountFromYear(ADate.Year - 1);
  // STEP 2
  DayCount := DayCount + GetDayCountFromMonth(ADate.Year, ADate.Month - 1, ADate.IsLeapMonth);
  // STEP 3
  DayCount := DayCount + ADate.Day;


  // [STEP 4] 기준일의 양음력차 보정
    // 음)1/1 = 양)1/30 경우 아래 로직 상 양력 1/1일부터 계산하므로 29일차 증가
  DayCount := DayCount + StandardBetweenStart;

  // ###### 양력일수에서 음력일자  구하기 ######
  // [STEP 5] 양력> 연도별 일자수 감소하며 연도 추출
  // [STEP 6] 양력> 월별 일자수 감소하면 월 추출
  // [STEP 7] 양력> 잔여일 수 일로 취득

  // STEP 5
  Result.Year := SupportYearStart - 1;
  for I := 0 to SupportYearCount - 1 do
  begin
    Inc(Result.Year);

    DaysOfYear := DaysPerYear[IsLeapYear(SupportYearStart + I)];
    if DayCount <= DaysOfYear then
      Break;

    DayCount := DayCount - DaysOfYear;
  end;

  // STEP 6
  Result.Month := 0;
  for I := 1 to 12 do
  begin
    Inc(Result.Month);

    DaysOfMonth := MonthDays[IsLeapYear(Result.Year)][I];
    if DayCount <= DaysOfMonth then
      Break;

    DayCount := DayCount - DaysOfMonth;
  end;

  // STEP 7
  Result.Day := DayCount;
end;

{===============================================================================
  # 양력일자를 음력일자로 변환하여 반환
  # Parameter
    ADate: TSolarDateRec - 변환 대상 양력일자
  # Return
    TLunarDateRec - 변환된 음력일자(윤달여부 포함)
===============================================================================}
function ThjLunarDateConverter.SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
  // 기준년도 부터 요청 년도까지의 일수 합 반환
  function GetDayCountFromYear(AYear: Word): Integer;
  begin
    Result := (AYear * 365) + (AYear div 4) - (AYear div 100) + (AYear div 400);
    Result := Result - StandardDateDelta;
  end;

  // 요청년도의 월까지 일수 합 반환
  function GetDayCountFromMonth(AYear, AMonth: Word): Integer;
  var
    I: Integer;
  begin
    Result := 0;

    for I := 1 to AMonth do
      Inc(Result, MonthDays[IsLeapYear(AYear)][I]);
  end;
var
  I: Integer;
  DayCount, MonDays: Integer;
  MonthTable: string;
begin
  try
    ValidateDate(ADate);
  except
    raise;
  end;

  ZeroMemory(@Result, SizeOf(Result));

  // ###### 양력일수 구하기 ######
  // [STEP 1] 양력> 기준년 부터 전년도까지 연도별 일자수 증가
  // [STEP 2] 양력> 전월까지 월별 일수 증가(윤년처리 포함)
  // [STEP 3] 양력> 일자 증가

  DayCount := 0;
  // STEP 1
  DayCount := DayCount + GetDayCountFromYear(ADate.Year - 1);
  // STEP 2
  DayCount := DayCount + GetDayCountFromMonth(ADate.Year, ADate.Month - 1);
  // STEP 3
  DayCount := DayCount + ADate.Day;

  // [STEP 4] 기준일의 양음력차 보정
    // 음)1/1 = 양)1/30 경우 아래 로직 상 양]1/30(음]1/1)일부터 계산해야 하므로 29 빼기
  DayCount := DayCount - StandardBetweenStart;

  // ###### 양력일수에서 음력일자  구하기 ######
  // [STEP 5] 음력> 연도 별 일자 수를 빼며 연도 추출
  // [STEP 6] 음력> 월별 일자 수를 빼며 월 추출
    // 6-1> 평달만 음력월 증가(윤달은 전달의 달번호 계속사용, ex>...3월,윤3월,4월...)
    // 6-2> 음력월의 대/소월 구분(29 or 30)
    // 6-3> 잔여일수(DayCount)가 음력월의 일수보다 작아질때까지 반복
  // [STEP 7] 잔여 일수를 음력일로 처리

  // STEP 5
  Result.Year := SupportYearStart - 1;
  for I := 0 to Length(LunarYearDays) - 1 do
  begin
    Inc(Result.Year);

    if LunarYearDays[I] >= DayCount  then
      Break;

    DayCount := DayCount - LunarYearDays[I];
  end;

  // STEP 6
  Result.Month := 0;
  MonthTable := LunarMonthTable[I];
  for I := 1 to Length(MonthTable) do
  begin
    // 6-1
    if CharInSet(MonthTable[I], ['1', '2']) then
      Inc(Result.Month);

    // 6-2
    if CharInSet(MonthTable[I], ['1', '3']) then      // 소월은 29일
      MonDays := 29
    else if CharInSet(MonthTable[I], ['2', '4']) then // 대월은 30일
      MonDays := 30
    else
      raise Exception.CreateFmt('Incorrect lunar month table data(Index: %d, Char: %s)', [I, MonthTable[I]])
    ;

    // 6-3
    if MonDays >= DayCount then
    begin
      if CharInSet(MonthTable[I], ['3', '4']) then
        Result.IsLeapMonth := True;
      Break;
    end;

    DayCount := DayCount - MonDays;
  end;

  // STEP 7
  Result.Day := DayCount;
end;

procedure ThjLunarDateConverter.test;
var
  I, J, Sum: Integer;
begin
  for I := 0 to Length(LunarMonthTable) - 1 do
  begin
    Sum := 0;
    for J := 0 to Length(LunarMonthTable[I]) - 1 do
    begin

      if CharInSet(LunarMonthTable[I][J], ['1', '3']) then
        Sum := Sum + 29
      else if CharInSet(LunarMonthTable[I][J], ['2', '4']) then
        Sum := Sum + 30
      ;
    end;

    if Sum <> LunarYearDays[I] then
      OutputDebugString(PChar(Format('Incorrect Index: %d, SumDays: (%d, %d)', [I, Sum, LunarYearDays[I]])));
  end;
  OutputDebugString(PChar('Correct Table data'));
end;

// 음력 달의 마지막 날을 반환한다.
function ThjLunarDateConverter.GetLunarDaysOfMonth(AYear, AMonth: Word;
  AIsLeapMonth: Boolean): Word;
var
  MonthTable: string;
  I, MonthIndex: Integer;
begin
  Result := 0;
  MonthTable := LunarMonthTable[AYear - SupportYearStart];

  MonthIndex := AMonth;
  // 요청달의 이전에 윤달이 있으면 Index 증가
  for I := 1 to AMonth do
  begin
    if CharInSet(MonthTable[I], ['3', '4']) then
      Inc(MonthIndex);
  end;

  // 윤달요청 경우 예외
  if AIsLeapMonth then
  begin
    Inc(MonthIndex);
    // 실제 윤달이 아니면 종료
    if not CharInSet(MonthTable[MonthIndex], ['3', '4']) then
      Exit;
    Result := IfThen(MonthTable[MonthIndex] = '3', 29, 30);
  end;

  Result := IfThen(MonthTable[MonthIndex] = '1', 29, 30);
end;


end.



