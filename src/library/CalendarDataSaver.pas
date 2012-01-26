unit CalendarDataSaver;

interface

uses
  Windows, Classes, SysUtils,
  CalendarCommons;

type
  TCalendarDataSaver = class(TObject)
  protected
    FFileStream: TFileStream;
  public
    constructor Create(APath: string); virtual;
    destructor Destroy; override;

    procedure AddData(AData: TCalendarData); virtual; abstract;
  end;

implementation

uses
  Math;

{ TCalendarDataSaver }

{ TCalendarDataSaver }

constructor TCalendarDataSaver.Create(APath: string);
begin
  FFileStream := TFileStream.Create(APath, IfThen(FileExists(APath), fmOpenReadWrite or fmShareDenyNone, fmCreate));
end;

destructor TCalendarDataSaver.Destroy;
begin
  FFileStream.Free;
  OutputDebugString(PChar('TCalendarDataSaver.Destroy'));

  inherited;
end;

end.
