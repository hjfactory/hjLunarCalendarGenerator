unit LunarCalendarDataGenerator;

interface

uses
  hjLunarDateType ,hjLunarDateConverter, CalendarDataGenerator, CalendarCommons;

type
  TLunarCalendarSource = class(TCalendarSource)
  private
    FIndex: Integer;
    FDisplayDays: TDispDaySet;
  public
    constructor Create(ADispDays: TDispDaySet);

    procedure First; overload;
    function Next: Boolean; overload;
    function Day: Word; overload;
  end;

  TLunarCalendarDataGenerator = class(TCalendarDataGenerator)
  private
    FCurrentDate: TSolarDateRec;
  protected
    procedure initialize; overload;
  public
    function Next: TCalendarData; override;
  end;

implementation

{ TLunarCalendarSource }

constructor TLunarCalendarSource.Create(ADispDays: TDispDaySet);
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

function TLunarCalendarSource.Next: Boolean;
begin
  Inc(FIndex);
  Result := FIndex < Length(FDisplayDays);
end;

{ TLunarCalendarDataGenerate }

procedure TLunarCalendarDataGenerator.initialize;
begin
  FCurrentDate := DateRec(FStartOfRange, 1, 1);
end;

function TLunarCalendarDataGenerator.Next: TCalendarData;
begin
  Result := nil;
end;

end.
