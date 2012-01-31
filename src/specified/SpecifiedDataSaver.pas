unit SpecifiedDataSaver;

interface

uses
  SpecifiedData;

type
  TSpecifiedDataSaver = class(TObject)
  public
    procedure Save(AData: TSpecifiedData); virtual; abstract;
  end;

implementation

end.
