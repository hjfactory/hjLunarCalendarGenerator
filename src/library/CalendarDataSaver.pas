unit CalendarDataSaver;

interface

uses
  Windows, Classes, SysUtils,
  CalendarCommons;

type
  TCalendarDataSaver = class(TObject)
  protected
    FFilePath: string;
    FFileStream: TFileStream;

    procedure WriteData(AData: string); virtual;
  public
    constructor Create(APath: string); virtual;
    destructor Destroy; override;

    procedure BeginSave; virtual;
    procedure EndSave; virtual;
    procedure AddData(AData: TCalendarData); virtual; abstract;
  end;

implementation

uses
  Math;

{ TCalendarDataSaver }

constructor TCalendarDataSaver.Create(APath: string);
begin
  if FileExists(APath) then
    DeleteFile(APath);

  FFilePath := APath;
  FFileStream := TFileStream.Create(APath, fmCreate or fmShareDenyWrite);
end;

destructor TCalendarDataSaver.Destroy;
begin
  FFileStream.Free;

  inherited;
end;

procedure TCalendarDataSaver.BeginSave;
begin

end;

procedure TCalendarDataSaver.EndSave;
begin

end;

procedure TCalendarDataSaver.WriteData(AData: string);
begin
  AData := AData + #13#10;
  FFileStream.Position := FFileStream.Size;
  FFileStream.Write(Pointer(AData)^, Length(AData)*2);
end;

end.
