unit LunarCalendarDataGenerator;

interface

uses
  hjLunarDateType ,hjLunarDateConverter, CalendarDataGenerator, CalendarCommons;

type
  TLunarCalendarSource = class(TCalendarSource)
  private
    FIndex: Integer;
    FDisplayDays: TDispDays;
  public
    constructor Create(ADispDays: TDispDays);

    procedure First; overload;
    function Next: Boolean; overload;
    function HasNext: Boolean; overload;
    function Day: Word; overload;
  end;

  TLunarCalendarDataGenerator = class(TCalendarDataGenerator)
  private
    FCurrentDate: TSolarDateRec;
    FYear,
    FMonth: Word;
  protected
    procedure initialize; overload;
  public
    function Next: TCalendarData; override;
  end;

implementation

{ TLunarCalendarSource }

constructor TLunarCalendarSource.Create(ADispDays: TDispDays);
begin
  FDisplayDays := ADispDays;
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

function TLunarCalendarSource.Next: Boolean;
begin
  Inc(FIndex);
end;

{ TLunarCalendarDataGenerate }

procedure TLunarCalendarDataGenerator.initialize;
begin
  FCurrentDate := DateRec(FStartOfRange, 1, 1);

  FYear   := FStartOfRange;
  FMonth  := 1;
end;

function TLunarCalendarDataGenerator.Next: TCalendarData;
begin
  Result := nil;

  // 없으면 Month 증가

  // Month가 가득차면 Year 증가

  // Year이 FEndOfRange보다 크면 종료

  // Source에 Next 요청

end;

end.
