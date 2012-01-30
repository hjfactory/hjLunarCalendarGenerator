object frmSpecified: TfrmSpecified
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44592#45392#51068' '#46321#47197
  ClientHeight = 156
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object lblLunarDate: TLabel
    Left = 13
    Top = 59
    Width = 56
    Height = 17
    Caption = #51020#47141#51068#51088
  end
  object lblSummury: TLabel
    Left = 8
    Top = 92
    Width = 70
    Height = 17
    Caption = #44592#45392#51068#45236#50857
  end
  object lblDescription: TLabel
    Left = 8
    Top = 16
    Width = 340
    Height = 17
    Caption = #8251' '#51020#47141#49373#51068', '#51020#47141#44592#45392#51068', '#51020#47141#51228#49324#51068' '#46321#51012' '#51077#47141#54616#49464#50836'.'
  end
  object lblLunarMonth: TLabel
    Left = 136
    Top = 59
    Width = 14
    Height = 17
    Caption = #50900
  end
  object lblLunarDay: TLabel
    Left = 208
    Top = 59
    Width = 14
    Height = 17
    Caption = #51068
  end
  object edtLunarMonth: TEdit
    Left = 91
    Top = 56
    Width = 38
    Height = 25
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    OnKeyPress = edtOnlyNumericKeyPress
  end
  object edtLunarDay: TEdit
    Left = 168
    Top = 56
    Width = 33
    Height = 25
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
    OnExit = edtLunarDayExit
    OnKeyPress = edtOnlyNumericKeyPress
  end
  object edtSummury: TEdit
    Left = 91
    Top = 87
    Width = 353
    Height = 25
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 288
    Top = 118
    Width = 75
    Height = 25
    Caption = #51200#51109
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 369
    Top = 118
    Width = 75
    Height = 25
    Cancel = True
    Caption = #52712#49548
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnDelete: TButton
    Left = 207
    Top = 118
    Width = 75
    Height = 25
    Caption = #49325#51228
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object chkLunarLastDay: TCheckBox
    Left = 240
    Top = 60
    Width = 97
    Height = 17
    Caption = #47568#51068
    TabOrder = 6
    OnClick = chkLunarLastDayClick
  end
end
