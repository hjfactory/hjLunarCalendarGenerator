unit LunarCalendarDataGenerator;

interface

uses
  SysUtils,
  hjLunarDateType ,hjLunarDateConverter,
  CalendarCommons, CalendarDataGenerator, CalendarData;

type
  TLunarDispDays = array of word;

  TLunarCalendarSource = class(TCalendarSource)
  private
    FIndex: Integer;
    FDisplayDaysType: TLunarDaysDisplayType;
    FDisplayDays: TLunarDispDays;
  public
    constructor Create(ADispType: TLunarDaysDisplayType);

    procedure First; override;
    procedure Next; override;
    function HasNext: Boolean; override;
    function Day: Word;

    property DisplayDaysType: TLunarDaysDisplayType read FDisplayDaysType;
  end;

  TLunarCalendarDataGenerator = class(TCalendarDataGenerator)
  private
    FYear: Word;
    FIndexOfMonth: Integer;   // 음력월의 인덱스(월번호랑 다름)

    function GetLunarDateRec(AYear: Word; AIndexOfMonth: Integer; ADay: Word): TLunarDateRec;
    function GetSummury(ADispType: TLunarDaysDisplayType; ALunar: TLunarDateRec): string;
  protected
    procedure Initialize; override;
  public
    function NextData: TCalendarData; override;
  end;

implementation

uses
  StrUtils;

{ TLunarCalendarSource }

constructor TLunarCalendarSource.Create(ADispType: TLunarDaysDisplayType);
  procedure SetData(const Args: array of word);
  var
    I: Integer;
  begin
    SetLength(FDisplayDays, Length(Args));
    for I := 0 to Length(Args) - 1 do
      FDisplayDays[I] := Args[I];
  end;
begin
  FDisplayDaysType := ADispType;

  case FDisplayDaysType of
    lddt5:    SetData([1, 5, 10, 15, 20, 25, 99]);
    lddt10:   SetData([1, 10, 20, 99]);
    lddt15:   SetData([1, 15, 99]);
    lddtKor:  SetData([1, 5, 10, 15, 20, 25, 99]);
  end;
end;

function TLunarCalendarSource.Day: Word;
begin
  Result := 0;
  if FIndex < Length(FDisplayDays) then
    Result := FDisplayDays[FIndex];
end;

procedure TLunarCalendarSource.First;
begin
  FIndex := 0;
end;

function TLunarCalendarSource.HasNext: Boolean;
begin
  Result := FIndex < Length(FDisplayDays);
end;

procedure TLunarCalendarSource.Next;
begin
  Inc(FIndex);
end;

{ TLunarCalendarDataGenerate }

procedure TLunarCalendarDataGenerator.Initialize;
begin
  FYear   := FStartOfRange;
  FIndexOfMonth  := 1;
end;

function TLunarCalendarDataGenerator.GetSummury(
  ADispType: TLunarDaysDisplayType; ALunar: TLunarDateRec): string;

const
  // 한국 달이름
  LunarKoreanMonthName: array[1..12] of string = (
      '정월', '이월', '삼월', '사월', '오월',   '유월'
    , '칠월', '팔월', '구월', '시월', '동짓달', '섣달'
  );
  LunarKoreanHalfMonth: string      = '보름';
  LunarKoreanEndOfTheMonth: string  = '그믐';
begin
  case ADispType of
  lddt5..lddt15:
    Result := Format('%s%d.%d', [IfThen(ALunar.IsLeapMonth, '(윤)', ''), ALunar.Month, ALunar.Day]);
  lddtKor:
    begin
      case ALunar.Day of
      1:      Result := IfThen(ALunar.IsLeapMonth, '윤', '') + LunarKoreanMonthName[ALunar.Month];
      15:     Result := LunarKoreanHalfMonth;
      5, 10, 20, 25:
              Result := Format('%s%d.%d', [IfThen(ALunar.IsLeapMonth, '(윤)', ''), ALunar.Month, ALunar.Day]);
      else    Result := Format('%s(%d)', [LunarKoreanEndOfTheMonth, ALunar.Day]);
      end;
    end;
  end;
end;

function TLunarCalendarDataGenerator.GetLunarDateRec(AYear: Word;
  AIndexOfMonth: Integer; ADay: Word): TLunarDateRec;
begin
  Result.Year := FYear;

  FLunarDateConvertor.GetLunarMonthFromMonthIndex(FYear, AIndexOfMonth, Result.Month, Result.IsLeapMonth);

  // 말일 처리
  if ADay > 30 then
    Result.Day := FLunarDateConvertor.GetLunarDaysOfMonth(FYear, Result.Month, Result.IsLeapMonth)
  else
    Result.Day := ADay;
end;

// 연도의 월별로 순환하며 Source의 Day만큼 반복한다.
function TLunarCalendarDataGenerator.NextData: TCalendarData;
var
  Lunar: TLunarDateRec;
  Solar: TSolarDateRec;
  Summary: string;
  Source: TLunarCalendarSource;
begin
  Result := nil;

  Source := TLunarCalendarSource(FCalendarSource);

  // Source는 월별 데이터이므로 없으면 다음달(Month 증가)
  if not Source.HasNext then
  begin
    Inc(FIndexOfMonth);
    Source.First;
  end;

  // 월 인덱스 초과 시 연도증가 순환
  if not FLunarDateConvertor.InvalidMonthIndex(FYear, FIndexOfMonth) then
  begin
    Inc(FYear);
    FIndexOfMonth := 1;
  end;

  if FYear > FEndOfRange then
    Exit;

  try
    Lunar := GetLunarDateRec(FYear, FIndexOfMonth, Source.Day);
    Solar := FLunarDateConvertor.LunarToSolar(Lunar);
    Summary := GetSummury(Source.DisplayDaysType, Lunar);

    Result := FCalendarData.SetData(Solar, Lunar, Summary, '');

    Source.Next;
  except
    raise
  end;
end;

end.
