unit SpecifiedDataFile;

interface

uses
  SpecifiedData;

type
  TSpecifiedDataFile = class(TObject)
  protected
    FPath: string;
  public
    constructor Create(APath: string; ADataList: TSpecifiedList);

    procedure Save(AData: TSpecifiedData); virtual; abstract;
    procedure Load; virtual; abstract;
  end;

implementation

{ TSpecifiedDataFile }

constructor TSpecifiedDataFile.Create(APath: string; ADataList: TSpecifiedList);
begin
  FPath := APath;
end;

end.
