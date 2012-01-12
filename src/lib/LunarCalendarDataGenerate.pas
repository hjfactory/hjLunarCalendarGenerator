unit LunarCalendarDataGenerate;

interface

uses
  hjLunarDateConverter, CalendarDataGenerate, CommonType;

type
  TLunarCalendarSource = class(TCalendarSource)
  public
    constructor Create(ADispDayType: Integer);
  end;

  TLunarCalendarDataGenerate = class(TCalendarDataGenerate)
  private
    FCurrentDate: TSolarDateRec;
  protected
    procedure initialize; overload;
  public
    function Next: TCalendarData; override;
  end;

implementation

{ TLunarCalendarSource }

constructor TLunarCalendarSource.Create(ADispDayType: Integer);
begin

end;

{ TLunarCalendarDataGenerate }

procedure TLunarCalendarDataGenerate.initialize;
begin
  FCurrentDate := DateRec(FStartOfRange, 1, 1);
end;

function TLunarCalendarDataGenerate.Next: TCalendarData;
begin
  Result := nil;
end;

end.
