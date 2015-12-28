unit SpecifiedDataFileToIni;

interface

uses
  IniFiles, SysUtils,
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDataFileToIni = class(TSpecifiedDataFile)
  private
    FIniFile: TIniFile;

    function SaveData(AData: TSpecifiedData): Boolean;
  public
    constructor Create(APath: string);
    destructor Destroy; override;

    function Append(AData: TSpecifiedData): Boolean; override;
    function Update(AData: TSpecifiedData): Boolean; override;
    function Delete(AData: TSpecifiedData): Boolean; override;

    procedure Load(ADataList: TSpecifiedDataList); override;
  end;

implementation

uses
  Classes, System.IOUtils;

{ TSpecifiedDataSaverToIni }

constructor TSpecifiedDataFileToIni.Create(APath: string);
begin
  inherited;

  FIniFile := TIniFile.Create(TPath.Combine(TPath.GetLibraryPath, FFilePath));
end;

destructor TSpecifiedDataFileToIni.Destroy;
begin
  FIniFile.Free;

  inherited;
end;

function TSpecifiedDataFileToIni.SaveData(AData: TSpecifiedData): Boolean;
begin
  FIniFile.WriteInteger(AData.ID, 'Month',   AData.Month);
  FIniFile.WriteInteger(AData.ID, 'Day',     AData.Day);
  FIniFile.WriteString(AData.ID, 'Summary', AData.Summary);

  Result := True;
end;

function TSpecifiedDataFileToIni.Append(AData: TSpecifiedData): Boolean;
begin
  Result := SaveData(AData);
end;

function TSpecifiedDataFileToIni.Update(AData: TSpecifiedData): Boolean;
begin
  Result := SaveData(AData);
end;

function TSpecifiedDataFileToIni.Delete(AData: TSpecifiedData): Boolean;
begin
  FIniFile.EraseSection(AData.ID);
  Result := True;
end;

procedure TSpecifiedDataFileToIni.Load(ADataList: TSpecifiedDataList);
var
  I: Integer;
  Data: TSpecifiedData;
  StrList: TStringList;
begin
  StrList := TStringList.Create;
  try
    FIniFile.ReadSections(StrList);

    for I := 0 to StrList.Count - 1 do
    begin
      Data := TSpecifiedData.Create;
      Data.ID := StrList[I];
      Data.Month    := FIniFile.ReadInteger(Data.ID, 'Month', 1);
      Data.Day      := FIniFile.ReadInteger(Data.ID, 'Day', 1);
      Data.Summary  := FIniFile.ReadString(Data.ID, 'Summary', '');

      ADataList.AppendData(Data);
    end;
  finally
    StrList.Free;
  end;
end;

end.
