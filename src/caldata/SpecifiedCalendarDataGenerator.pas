unit SpecifiedCalendarDataGenerator;

interface

uses
  SysUtils,
  hjLunarDateType ,hjLunarDateConverter,
  CalendarCommons, CalendarDataGenerator, CalendarData,
  SpecifiedData;

type
  TSpecifiedCalendarSource = class(TCalendarSource)
  private
    FIndex: Integer;
    FDataList: TSpecifiedDataList;
    function GetDay: Word;
    function GetMonth: Word;
    function GetSummary: string;
  public
    constructor Create(ADataList: TSpecifiedDataList);

    procedure First; override;
    procedure Next; override;
    function HasNext: Boolean; override;

    property Month: Word read GetMonth;
    property Day: Word read GetDay;
    property Summary: string read GetSummary;
  end;

  TSpecifiedCalendarDataGenerator = class(TCalendarDataGenerator)
  private
    FYear: Word;
  protected
    procedure Initialize; override;
  public
    function NextData: TCalendarData; override;
  end;


implementation

{ TSpecifiedCalendarSource }

constructor TSpecifiedCalendarSource.Create(ADataList: TSpecifiedDataList);
begin
  FDataList := ADataList;
end;

procedure TSpecifiedCalendarSource.First;
begin
  FIndex := 0;

end;

function TSpecifiedCalendarSource.GetMonth: Word;
begin
  Result := FDataList[FIndex].Month;
end;

function TSpecifiedCalendarSource.GetSummary: string;
begin
  Result := FDataList[FIndex].Summary;
end;

function TSpecifiedCalendarSource.GetDay: Word;
begin
  Result := FDataList[FIndex].Day;
end;

function TSpecifiedCalendarSource.HasNext: Boolean;
begin
  Result := FIndex < FDataList.Count;
end;

procedure TSpecifiedCalendarSource.Next;
begin
  Inc(FIndex);
end;

{ TSpecifiedCalendarDataGenerator }

procedure TSpecifiedCalendarDataGenerator.Initialize;
begin
  FYear   := FStartOfRange;
  FCalendarSource.First;
end;

function TSpecifiedCalendarDataGenerator.NextData: TCalendarData;
var
  Lunar: TLunarDateRec;
  Solar: TSolarDateRec;
  Summary: string;
  Source: TSpecifiedCalendarSource;
  Day: Word;
begin
  Result := nil;

  Source := TSpecifiedCalendarSource(FCalendarSource);

  if not Source.HasNext then
  begin
    Inc(FYear);
    Source.First;
  end;

  if FYear > FEndOfRange then
    Exit;

  try
    Day := Source.Day;
    if Day = LunarLastDay then
      Day := FLunarDateConvertor.GetLunarDaysOfMonth(FYear, Source.Month, False);

    Lunar := DateRec(FYear, Source.Month, Day, False);
    Solar := FLunarDateConvertor.LunarToSolar(Lunar);
    Summary := Source.Summary;

    Result := FCalendarData.SetData(Solar, Lunar, Summary, '');

    Source.Next;
  except
    raise
  end;
end;

end.
