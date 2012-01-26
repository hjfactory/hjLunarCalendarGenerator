unit CalendarDataSaverToICS;

interface

uses
  WIndows, SysUtils,
  CalendarCommons, CalendarDataSaver;

type
  TCalendarSaverToICS = class(TCalendarDataSaver)
  public
    constructor Create(APath: string); override;
    destructor Destroy; override;

    procedure AddData(AData: TCalendarData); override;
  end;

implementation

{ TCalendarSaverToICS }

procedure TCalendarSaverToICS.AddData(AData: TCalendarData);
begin
  OutputDebugString(PChar(Format('S: %d-%d-%d, L: %d-%d-%d, Summury: %s', [
      AData.Solar.Year
    , AData.Solar.Month
    , AData.Solar.Day
    , AData.Lunar.Year
    , AData.Lunar.Month
    , AData.Lunar.Day
    , AData.Summary
  ])));
end;

constructor TCalendarSaverToICS.Create(APath: string);
begin
  inherited;

end;

destructor TCalendarSaverToICS.Destroy;
begin
  OutputDebugString(PChar('TCalendarSaverToICS.Destroy'));

  inherited Destroy;
end;

end.
