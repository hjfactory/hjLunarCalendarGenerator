unit SpecifiedDateController;

interface

uses
  IniFiles;

type
  TSpecifiedDateController = class(TObject)
  private
    FIniFile: TIniFile;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSpecifiedDateController }

constructor TSpecifiedDateController.Create;
begin
//  FIniFile.ReadSections();

end;

destructor TSpecifiedDateController.Destroy;
begin

  inherited;
end;

end.
