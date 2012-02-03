unit Environment;

interface

type
  TEnvironment = class(TObject)
  private
    FSpecifiedFileName: string;
  public
    constructor Create;

    property SpecifiedFileName: string read FSpecifiedFileName;
  end;

  function Env: TEnvironment;

implementation

var
  _Env: TEnvironment;

function Env: TEnvironment;
begin
  if not Assigned(_Env) then
    _Env := TEnvironment.Create;

  Result := _Env;
end;

{ TEnvironment }

constructor TEnvironment.Create;
begin
  FSpecifiedFileName := 'SpecifiedData.dat';
end;

initialization

finalization
  if Assigned(_Env) then
    _Env.Free;

end.
