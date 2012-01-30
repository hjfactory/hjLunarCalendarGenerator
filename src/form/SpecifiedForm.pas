unit SpecifiedForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SpecifiedData;

const
  smrSave   = 20;
  smrUpdate = 21;
  smrDelete = 22;
  smrCancel = 23;

type
  TfrmSpecified = class(TForm)
    lblLunarDate: TLabel;
    edtLunarMonth: TEdit;
    edtLunarDay: TEdit;
    edtSummury: TEdit;
    lblSummury: TLabel;
    btnSave: TButton;
    btnCancel: TButton;
    lblDescription: TLabel;
    btnDelete: TButton;
    lblLunarMonth: TLabel;
    lblLunarDay: TLabel;
    chkLunarLastDay: TCheckBox;
    procedure chkLunarLastDayClick(Sender: TObject);
    procedure edtOnlyNumericKeyPress(Sender: TObject; var Key: Char);
    procedure edtLunarDayExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FData: TSpecifiedData;
    { Private declarations }
  public
    { Public declarations }
    property Data: TSpecifiedData read FData write FData;
  end;

var
  frmSpecified: TfrmSpecified;

implementation

uses
  Math, StrUtils, CalendarCommons;

{$R *.dfm}

procedure TfrmSpecified.FormShow(Sender: TObject);
begin
  if Assigned(FData) then
  begin
    edtLunarMonth.Text  := IntToStr(FData.Month);
    edtLunarDay.Text    := IfThen(FData.Day = LunarLastDay, '말일', IntToStr(FData.Day));
    chkLunarLastDay.Checked := FData.Day = LunarLastDay;
    edtSummury.Text     := FData.Summury;
  end;
end;

procedure TfrmSpecified.btnCancelClick(Sender: TObject);
begin
  if    (edtLunarMonth.Text <> IntToStr(FData.Month))
    or  (edtLunarDay.Text <> IntToStr(FData.Day))
    or  (edtSummury.Text <> FData.Summury) then
  begin
    if Application.MessageBox(
      PChar('변경된 내용이 있습니다.'#13#10 +
            '그래도 취소하시겠습니까?'),
      PChar('hjLunarCalendarGenerator'),
      MB_ICONQUESTION OR MB_YESNO) = ID_NO then
    begin
      Exit;
    end;
  end;

  ModalResult := smrCancel;
  Close;
end;

procedure TfrmSpecified.btnDeleteClick(Sender: TObject);
begin
  if Application.MessageBox(
    PChar(Format('기념일 ''%s(%d월 %d일)''을'#13#10 +
          '삭제하시겠습니까?', [FData.Summury, FData.Month, FData.Day])),
    PChar('hjLunarCalendarGenerator'),
    MB_ICONQUESTION OR MB_YESNO) = ID_NO then
  begin
    Exit;
  end;

  ModalResult := smrDelete;
  Close;
end;

procedure TfrmSpecified.btnSaveClick(Sender: TObject);
var
  Day: Integer;
begin
  Day := IfThen(edtLUnarDay.Text = '말일', LunarLastDay, StrToInt(edtLUnarDay.Text));

  if not Assigned(FData) then
  begin
    FData := TSpecifiedData.Create('', StrToInt(edtLunarMonth.Text), Day, edtSummury.Text);
    ModalResult := smrSave;
  end
  else
  begin
    FData.Month := StrToInt(edtLunarMonth.Text);
    FData.Day   := Day;
    FData.Summury := edtSummury.Text;
    ModalResult := smrUpdate;
  end;

  Close;
end;

procedure TfrmSpecified.chkLunarLastDayClick(Sender: TObject);
begin
  edtLunarDay.Enabled := not TCheckbox(Sender).Checked;
  edtLunarDay.Text    := IfThen(TCheckbox(Sender).Checked, '말일', '');
end;

procedure TfrmSpecified.edtLunarDayExit(Sender: TObject);
begin
  if TEdit(Sender).Text = '30' then
  begin
    if Application.MessageBox(
      PChar('30일이 없는 달은 표시되지 않을 수 있습니다.'#13#10 +
            '매달 말일로 처리하겠습니까??'),
      PChar('hjLunarCalendarGenerator'),
      MB_ICONQUESTION OR MB_YESNO) = ID_YES then
    begin
      chkLunarLastDay.Checked := True;
    end;
  end;
end;

procedure TfrmSpecified.edtOnlyNumericKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9',#25,#08,#13])) then
    Key := #0;
end;

end.
