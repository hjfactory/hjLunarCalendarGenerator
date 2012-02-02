unit SpecifiedDataFileToIni;

interface

uses
  IniFiles,
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDataFileToIni = class(TSpecifiedDataFile)
  private
    FIniFile: TIniFile;
    FDataList: TSpecifiedList;
  public
    constructor Create(APath: string; ADataList: TSpecifiedList);
    destructor Destroy; override;

    procedure Save(AData: TSpecifiedData); override;
    procedure Load; override;
  end;

implementation

{ TSpecifiedDataSaverToIni }

constructor TSpecifiedDataFileToIni.Create(APath: string; ADataList: TSpecifiedList);
begin
  inherited;

  FIniFile := TIniFile.Create(FPath);
  FDataList := ADataList;

  Load;
end;

destructor TSpecifiedDataFileToIni.Destroy;
begin
  FIniFile.Free;

  inherited;
end;

procedure TSpecifiedDataFileToIni.Load;
begin

end;

procedure TSpecifiedDataFileToIni.Save(AData: TSpecifiedData);
begin

end;

end.
