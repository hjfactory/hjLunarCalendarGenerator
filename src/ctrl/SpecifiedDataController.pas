unit SpecifiedDataController;

interface

uses
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDateController = class(TObject)
  private
    FDataList: TSpecifiedDataList;
    FDataFile: TSpecifiedDataFile;
    function Get(Index: Integer): TSpecifiedData;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function AppendData(AData: TSpecifiedData): Boolean;
    function UpdateData(AData: TSpecifiedData): Boolean;
    function DeleteData(AData: TSpecifiedData): Boolean;

    function GetDatas(AMonth, ADay: Word): TSpecifiedDatas;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TSpecifiedData read Get; default;
    property DataList: TSpecifiedDataList read FDataList;
  end;

implementation

uses
  Environment, SpecifiedDataFileToIni;


{ TSpecifiedDateController }

constructor TSpecifiedDateController.Create;
begin
  FDataList := TSpecifiedDataList.Create;
  FDataFile := TSpecifiedDataFileToIni.Create(Env.SpecifiedFileName);
  FDataFile.Load(FDataList)
end;

destructor TSpecifiedDateController.Destroy;
begin
  FDataFile.Free;
  FDataList.Free;

  inherited;
end;

function TSpecifiedDateController.Get(Index: Integer): TSpecifiedData;
begin
  Result := FDataList[Index];
end;

function TSpecifiedDateController.GetCount: Integer;
begin
  Result := FDataList.Count;
end;

function TSpecifiedDateController.GetDatas(AMonth, ADay: Word): TSpecifiedDatas;
begin
  Result := FDataList.GetDatas(AMonth, ADay);
end;

function TSpecifiedDateController.AppendData(AData: TSpecifiedData): Boolean;
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

function TSpecifiedDateController.UpdateData(AData: TSpecifiedData): Boolean;
begin
  Result := FDataFile.Update(AData);
end;

function TSpecifiedDateController.DeleteData(AData: TSpecifiedData): Boolean;
begin
  if FDataFile.Delete(AData) then
    FDataList.DeleteData(AData);
  Result := True;
end;

end.
