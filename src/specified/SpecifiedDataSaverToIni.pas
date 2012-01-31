unit SpecifiedDataSaverToIni;

interface

uses
  IniFiles,
  SpecifiedData, SpecifiedDataSaver;

type
  TSpecifiedDataSaverToIni = class(TSpecifiedDataSaver)
  public
    constructor Create;
    destructor Destroy; override;

    procedure Saver(AData: TSpecifiedData);
  end;

implementation

{ TSpecifiedDataSaverToIni }

constructor TSpecifiedDataSaverToIni.Create;
begin

end;

destructor TSpecifiedDataSaverToIni.Destroy;
begin

  inherited;
end;

procedure TSpecifiedDataSaverToIni.Saver(AData: TSpecifiedData);
begin

end;

end.
