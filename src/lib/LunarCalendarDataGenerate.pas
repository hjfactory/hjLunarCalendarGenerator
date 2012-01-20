unit LunarCalendarDataGenerate;

interface

uses
  hjLunarDateType ,hjLunarDateConverter, CalendarDataGenerate, CommonType;

type
  TLunarCalendarSource = class(TCalendarSource)
  private
    FIndex: Integer;
    FDisplayDays: array of Word;
  public
    constructor Create(ADispDays: array of Word);

    procedure First; overload;
    function Next: Boolean; overload;
    function Day: Word; overload;
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

constructor TLunarCalendarSource.Create(ADispDays: array of Word);
var
  I: Integer;
begin
  SetLength(FDisplayDays, Length(ADispDays));
  for I := 0 to Length(ADispDays) - 1 do
    FDisplayDays[I] := ADispDays[I];
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

procedure TLunarCalendarDataGenerate.initialize;
begin
  FCurrentDate := DateRec(FStartOfRange, 1, 1);
end;

function TLunarCalendarDataGenerate.Next: TCalendarData;
begin
  Result := nil;
end;

end.
