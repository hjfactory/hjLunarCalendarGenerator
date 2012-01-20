object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'hjLunarCalendarGenerator :: '#51020#47141#45804#47141' '#49373#49457#44592
  ClientHeight = 464
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 202
    Height = 13
    Caption = '2'#44032#51648' '#51333#47448#51032' '#45804#47141' '#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
  end
  object Label7: TLabel
    Left = 327
    Top = 447
    Width = 102
    Height = 13
    Caption = 'http://blog.hjf.pe.kr/'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 425
    Height = 97
    Caption = #51020#47141'/'#50577#47141' '#48320#54872
    TabOrder = 0
    object btnLunarToSolar: TButton
      Left = 232
      Top = 24
      Width = 177
      Height = 25
      Caption = #51020#47141#51012' '#50577#47141#51004#47196' '#48320#54872
      TabOrder = 0
      OnClick = btnLunarToSolarClick
    end
    object edtLunarYear: TEdit
      Left = 19
      Top = 26
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
      Text = '1980'
    end
    object edtLunarMonth: TEdit
      Left = 90
      Top = 26
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
      Text = '12'
    end
    object edtLunarDay: TEdit
      Left = 161
      Top = 26
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      Text = '12'
    end
    object btnSolarToLunar: TButton
      Left = 232
      Top = 53
      Width = 177
      Height = 25
      Caption = #50577#47141#51012' '#51020#47141#51004#47196' '#48320#54872
      TabOrder = 4
      OnClick = btnSolarToLunarClick
    end
    object edtSolarYear: TEdit
      Left = 19
      Top = 55
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 5
      Text = '1981'
    end
    object edtSolarMonth: TEdit
      Left = 90
      Top = 55
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 6
      Text = '1'
    end
    object edtSolarDay: TEdit
      Left = 161
      Top = 55
      Width = 65
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 7
      Text = '17'
    end
  end
  object pgcCalendar: TPageControl
    Left = 8
    Top = 152
    Width = 425
    Height = 289
    ActivePage = tsLunar
    TabOrder = 1
    object tsLunar: TTabSheet
      Caption = #51020#47141' '#45804#47141' '#49373#49457
      ExplicitLeft = 0
      ExplicitTop = 8
      object Label1: TLabel
        Left = 42
        Top = 71
        Width = 217
        Height = 13
        Caption = #47588#50900' 1'#51068', 10'#51068', 20'#51068', '#47568#51068#51012' '#54364#49884#54633#45768#45796'.'
      end
      object Label2: TLabel
        Left = 42
        Top = 119
        Width = 186
        Height = 13
        Caption = #47588#50900' 1'#51068', 15'#51068', '#47568#51068#51012' '#54364#49884#54633#45768#45796'.'
      end
      object Label3: TLabel
        Left = 42
        Top = 167
        Width = 300
        Height = 13
        Caption = #47588#50900' 1'#51068', 5'#51068', 10'#51068', 15'#51068' 20'#51068', 25'#51068', '#47568#51068#51012' '#54364#49884#54633#45768#45796'.'
      end
      object Label4: TLabel
        Left = 42
        Top = 215
        Width = 213
        Height = 13
        Caption = #47588#50900' 1'#51068', 10'#51068' 20'#51068', '#47568#51068#51012' '#54364#49884#54633#45768#45796'.'
      end
      object Label6: TLabel
        Left = 3
        Top = 10
        Width = 339
        Height = 26
        Caption = #50500#47000' '#54637#47785' '#51473' '#51020#47141#45804#47141#50640' '#54364#49884#54624' '#51068#51088' '#54805#49885#51012' '#49440#53469#54616#44256' '#45804#47141#54028#51068' '#13#10#49373#49457' '#48260#53948#51012' '#53364#47533#54616#49464#50836'.'
      end
      object RadioButton1: TRadioButton
        Left = 17
        Top = 48
        Width = 162
        Height = 17
        Caption = '10'#51068' '#44036#44201#51004#47196' '#54364#49884
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 17
        Top = 96
        Width = 162
        Height = 17
        Caption = '15'#51068' '#44036#44201#51004#47196' '#54364#49884
        TabOrder = 1
      end
      object RadioButton3: TRadioButton
        Left = 17
        Top = 144
        Width = 162
        Height = 17
        Caption = '5'#51068' '#44036#44201#51004#47196' '#54364#49884
        TabOrder = 2
      end
      object RadioButton4: TRadioButton
        Left = 17
        Top = 192
        Width = 162
        Height = 17
        Caption = #51020#47141#51060#47492#51004#47196' '#54364#49884
        TabOrder = 3
      end
      object btnMakeLunarCalendar: TButton
        Left = 284
        Top = 228
        Width = 130
        Height = 25
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 4
      end
    end
    object tsSpecified: TTabSheet
      Caption = #44592#45392#51068' '#45804#47141' '#49373#49457
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object lblSpecified: TLabel
        Left = 3
        Top = 10
        Width = 243
        Height = 13
        Caption = #44060#51064#51201#51064' '#44592#45392#51068#51012' '#52628#44032#54616#50668' '#45804#47141' '#54028#51068#51012' '#49373#49457
      end
      object lvSpecified: TListView
        Left = 3
        Top = 37
        Width = 411
        Height = 185
        Columns = <
          item
            Caption = #51020#47141#51068#51088
          end
          item
            Caption = #44592#45392#51068' '#51333#47448
          end>
        GridLines = True
        Items.ItemData = {
          03AD0000000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          00073431413147313B31343139314731074131343147313B3134313931473100
          000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000084131343139314731
          4131343139314731084131343139314731413134313931473100000000FFFFFF
          FFFFFFFFFF01000000FFFFFFFF00000000074131343139314731413134313931
          06413134313B31343139314731FFFFFFFFFFFF}
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Button1: TButton
        Left = 284
        Top = 6
        Width = 62
        Height = 25
        Caption = #52628#44032
        TabOrder = 1
      end
      object Button2: TButton
        Left = 352
        Top = 6
        Width = 62
        Height = 25
        Caption = #49325#51228
        TabOrder = 2
      end
      object btnMakeSpecifiedCalendar: TButton
        Left = 284
        Top = 228
        Width = 130
        Height = 25
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 3
      end
    end
  end
end
