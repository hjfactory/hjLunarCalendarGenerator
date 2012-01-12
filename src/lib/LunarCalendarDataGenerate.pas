unit LunarCalendarDataGenerate;

interface

uses
  CalendarDataGenerate, CommonType;

type
  TLunarCalendarSource = class(TCalendarSource)
  public
    constructor Create(ADispDayType: Integer);
  end;

  TLunarCalendarDataGenerate = class(TCalendarDataGenerate)
  private
    FDisplayType: Integer;
  published
  public
    constructor Create;
    destructor Destroy; override;

    function HasNext: Boolean; override;
    function Next: TCalendarData; override;

    property DisplayType: Integer read FDisplayType write FDisplayType;
  end;

implementation

{ TLunarCalendarSource }

constructor TLunarCalendarSource.Create(ADispDayType: Integer);
begin

end;

{ TLunarCalendarDataGenerate }

constructor TLunarCalendarDataGenerate.Create;
begin

end;

destructor TLunarCalendarDataGenerate.Destroy;
begin
  inherited;
end;

function TLunarCalendarDataGenerate.HasNext: Boolean;
begin

end;

function TLunarCalendarDataGenerate.Next: TCalendarData;
begin

end;

end.
