unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainController, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  T: DWORD;
begin
  with TMainController.Create do
  begin
    try
      T := GetTickCount;
      Test(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
      OutputDebugString(PChar(IntToStr(GetTickCount - T)));
    except on E: Exception do
//      ShowMessage(E.Message);
    end;
    Free;
  end;
end;

end.
