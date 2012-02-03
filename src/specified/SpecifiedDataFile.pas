unit SpecifiedDataFile;

interface

uses
  SpecifiedData;

type
  TSpecifiedDataFile = class(TObject)
  protected
    FFilePath: string;
    FDataList: TSpecifiedDataList;
  public
    constructor Create(APath: string; ADataList: TSpecifiedDataList);

    function Append(AData: TSpecifiedData): Boolean; virtual; abstract;
    function Update(AData: TSpecifiedData): Boolean; virtual; abstract;
    function Delete(AData: TSpecifiedData): Boolean; virtual; abstract;
    procedure Load; virtual; abstract;
  end;

implementation

{ TSpecifiedDataFile }

constructor TSpecifiedDataFile.Create(APath: string; ADataList: TSpecifiedDataList);
begin
  FFilePath := APath;
  FDataList := ADataList;
end;

end.
