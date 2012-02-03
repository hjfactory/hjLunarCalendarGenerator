unit SpecifiedDateController;

interface

uses
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDateController = class(TObject)
  private
    FDataList: TSpecifiedDataList;
    FDataFile: TSpecifiedDataFile;
  public
    constructor Create;
    destructor Destroy; override;

    function Append(AData: TSpecifiedData): Boolean;
    function Update(AData: TSpecifiedData): Boolean;
    function Delete(AData: TSpecifiedData): Boolean;
  end;

implementation

uses
  Environment, SpecifiedDataFileToIni;


{ TSpecifiedDateController }

constructor TSpecifiedDateController.Create;
begin
  FDataList := TSpecifiedDataList.Create;
  FDataFile := TSpecifiedDataFileToIni.Create(Env.SpecifiedFileName, FDataList);
end;

destructor TSpecifiedDateController.Destroy;
begin
  FDataFile.Free;
  FDataList.Free;

  inherited;
end;

function TSpecifiedDateController.Append(AData: TSpecifiedData): Boolean;
begin
  Result := False;
  try
    AData := FDataList.AppendData(AData);
    if AData.ID <> '' then
      Result := FDataFile.Append(AData);
  except
    raise
  end;
end;

function TSpecifiedDateController.Update(AData: TSpecifiedData): Boolean;
begin
  Result := FDataFile.Update(AData);
end;

function TSpecifiedDateController.Delete(AData: TSpecifiedData): Boolean;
begin
  FDataList.DeleteData(AData.ID);
  Result := FDataFile.Delete(AData);
end;

end.
