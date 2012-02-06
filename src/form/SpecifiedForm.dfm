object frmSpecified: TfrmSpecified
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #44592#45392#51068' '#46321#47197
  ClientHeight = 119
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblLunarDate: TLabel
    Left = 10
    Top = 45
    Width = 48
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #51020#47141#51068#51088
  end
  object lblSummury: TLabel
    Left = 6
    Top = 70
    Width = 60
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #44592#45392#51068#45236#50857
  end
  object lblDescription: TLabel
    Left = 6
    Top = 12
    Width = 291
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #8251' '#51020#47141#49373#51068', '#51020#47141#44592#45392#51068', '#51020#47141#51228#49324#51068' '#46321#51012' '#51077#47141#54616#49464#50836'.'
  end
  object lblLunarMonth: TLabel
    Left = 112
    Top = 45
    Width = 12
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #50900
  end
  object lblLunarDay: TLabel
    Left = 175
    Top = 45
    Width = 12
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #51068
  end
  object edtLunarMonth: TEdit
    Left = 70
    Top = 43
    Width = 38
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 2
    TabOrder = 0
    OnKeyPress = edtOnlyNumericKeyPress
    OnKeyUp = edtNextFocusKeyUp
  end
  object edtLunarDay: TEdit
    Left = 136
    Top = 43
    Width = 33
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 2
    TabOrder = 1
    OnExit = edtLunarDayExit
    OnKeyPress = edtOnlyNumericKeyPress
    OnKeyUp = edtNextFocusKeyUp
  end
  object edtSummury: TEdit
    Left = 70
    Top = 67
    Width = 270
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 220
    Top = 92
    Width = 58
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #51200#51109
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 282
    Top = 92
    Width = 58
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Cancel = True
    Caption = #52712#49548
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnDelete: TButton
    Left = 70
    Top = 92
    Width = 58
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #49325#51228
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object chkLunarLastDay: TCheckBox
    Left = 200
    Top = 46
    Width = 140
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #50900#51032' '#47568#51068#47196' '#52376#47532
    TabOrder = 6
    OnClick = chkLunarLastDayClick
  end
end
