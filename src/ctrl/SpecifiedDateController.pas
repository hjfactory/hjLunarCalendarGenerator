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

function RandomString(Size: Integer): string;
const
  SEED = '0123456789abcdefghijklmnopqrstuvwxyz';
begin
  Randomize;

  Result := '';
  repeat
    Result := Result + SEED[Random(Length(SEED)+1)];
  until (Length(Result) = Size);
end;

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

end.
