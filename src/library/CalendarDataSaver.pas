unit CalendarDataSaver;

interface

uses
  Windows, Classes, SysUtils,
  CalendarCommons;

type
  TCalendarDataSaver = class(TObject)
  public
    constructor Create(APath: string);
    destructor Destroy; override;

    procedure AddData(AData: TCalendarData);
  end;

implementation

{ TCalendarDataSaver }

procedure TCalendarDataSaver.AddData(AData: TCalendarData);
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

constructor TCalendarDataSaver.Create(APath: string);
begin

end;

destructor TCalendarDataSaver.Destroy;
begin

  inherited;
end;

end.
