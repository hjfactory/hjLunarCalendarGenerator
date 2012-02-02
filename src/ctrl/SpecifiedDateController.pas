unit SpecifiedDateController;

interface

uses
  SpecifiedData, SpecifiedDataFile;

type
  TSpecifiedDateController = class(TObject)
  private
    FFile: TSpecifiedDataFile;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Append(AData: TSpecifiedData);
    procedure Update(AData: TSpecifiedData);
    procedure Delete(AData: TSpecifiedData);
  end;

implementation

//uses


{ TSpecifiedDateController }

constructor TSpecifiedDateController.Create;
begin
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
