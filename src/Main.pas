unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainController, StdCtrls, hjLunarDateType, ExtCtrls, ComCtrls;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    btnLunarToSolar: TButton;
    edtLunarYear: TEdit;
    edtLunarMonth: TEdit;
    edtLunarDay: TEdit;
    btnSolarToLunar: TButton;
    edtSolarYear: TEdit;
    edtSolarMonth: TEdit;
    edtSolarDay: TEdit;
    pgcCalendar: TPageControl;
    tsLunar: TTabSheet;
    tsSpecified: TTabSheet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    lvSpecified: TListView;
    lblSpecified: TLabel;
    Button1: TButton;
    Button2: TButton;
    btnMakeSpecifiedCalendar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnMakeLunarCalendar: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnLunarToSolarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSolarToLunarClick(Sender: TObject);
  private
    { Private declarations }
    FMainController: TMainController;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnLunarToSolarClick(Sender: TObject);
var
  Lunar: TLunarDateRec;
  Solar: TSolarDateRec;
begin
  Lunar.Year  := StrToIntDef(edtLunarYear.Text, 0);
  Lunar.Month := StrToIntDef(edtLunarMonth.Text, 0);
  Lunar.Day   := StrToIntDef(edtLunarDay.Text, 0);
  Lunar.IsLeapMonth := False;

  try
    Solar := FMainController.LunarToSolar(Lunar);

    ShowMessage(Format('양력: %d-%d-%d', [Solar.Year, Solar.Month, Solar.Day]));
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmMain.btnSolarToLunarClick(Sender: TObject);
var
  Lunar: TLunarDateRec;
  Solar: TSolarDateRec;
begin
  Solar.Year  := StrToIntDef(edtSolarYear.Text, 0);
  Solar.Month := StrToIntDef(edtSolarMonth.Text, 0);
  Solar.Day   := StrToIntDef(edtSolarDay.Text, 0);

  try
    Lunar := FMainController.SolarToLunar(Solar);

    ShowMessage(Format('음력: %d-%d-%d', [Lunar.Year, Lunar.Month, Lunar.Day]));
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FMainController := TMainController.Create;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FMainController.Free;
end;

end.
