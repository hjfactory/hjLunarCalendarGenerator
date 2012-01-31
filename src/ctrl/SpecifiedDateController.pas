unit SpecifiedDateController;

interface

uses
  IniFiles, SpecifiedData, SpecifiedDataSaver, SpecifiedDataLoader;

type
  TSpecifiedDateController = class(TObject)
  private
    FSaver: TSpecifiedDataSaver;
    FLoader: TSpecifiedDataLoader;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Append(AData: TSpecifiedData);
    procedure Update(AData: TSpecifiedData);
    procedure Delete(AData: TSpecifiedData);
  end;

implementation

{ TSpecifiedDateController }

constructor TSpecifiedDateController.Create;
begin
//  FIniFile.ReadSections();
//  Randomize
end;

destructor TSpecifiedDateController.Destroy;
begin

  inherited;
end;

procedure TSpecifiedDateController.Delete(AData: TSpecifiedData);
begin

end;

procedure TSpecifiedDateController.Append(AData: TSpecifiedData);
begin

end;

procedure TSpecifiedDateController.Update(AData: TSpecifiedData);
begin

end;

end.
