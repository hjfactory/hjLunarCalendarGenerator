unit SpecifiedDataFile;

interface

uses
  SpecifiedData;

type
  TSpecifiedDataFile = class(TObject)
  protected
    FFilePath: string;
  public
    constructor Create(APath: string);

    function Append(AData: TSpecifiedData): Boolean; virtual; abstract;
    function Update(AData: TSpecifiedData): Boolean; virtual; abstract;
    function Delete(AData: TSpecifiedData): Boolean; virtual; abstract;

    procedure Load(ADataList: TSpecifiedDataList); virtual; abstract;
  end;

implementation

{ TSpecifiedDataFile }

constructor TSpecifiedDataFile.Create(APath: string);
begin
  FFilePath := APath;
end;

end.
