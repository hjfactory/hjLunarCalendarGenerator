unit SpecifiedDataFileToIni;

interface

uses
  IniFiles, SysUtils, Forms,
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDataFileToIni = class(TSpecifiedDataFile)
  private
    FIniFile: TIniFile;
  public
    constructor Create(APath: string; ADataList: TSpecifiedDataList);
    destructor Destroy; override;

    function Append(AData: TSpecifiedData): Boolean; override;
    function Update(AData: TSpecifiedData): Boolean; override;
    function Delete(AData: TSpecifiedData): Boolean; override;
    procedure Load; override;
  end;

implementation

{ TSpecifiedDataSaverToIni }

constructor TSpecifiedDataFileToIni.Create(APath: string; ADataList: TSpecifiedDataList);
begin
  inherited;

  FIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +  FFilePath);

  Load;
end;

destructor TSpecifiedDataFileToIni.Destroy;
begin
  FIniFile.Free;

  inherited;
end;

function TSpecifiedDataFileToIni.Append(AData: TSpecifiedData): Boolean;
begin
  FIniFile.WriteInteger(AData.ID, 'Month',   AData.Month);
  FIniFile.WriteInteger(AData.ID, 'Day',     AData.Day);
  FIniFile.WriteString(AData.ID, 'Summury', AData.Summury);

  Result := True;
end;

function TSpecifiedDataFileToIni.Update(AData: TSpecifiedData): Boolean;
begin

end;

function TSpecifiedDataFileToIni.Delete(AData: TSpecifiedData): Boolean;
begin

end;

procedure TSpecifiedDataFileToIni.Load;
begin

end;

end.
