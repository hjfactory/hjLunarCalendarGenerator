object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'hjLunarCalendarGenerator :: '#51020#47141#45804#47141' '#49373#49457#44592
  ClientHeight = 500
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 259
    Height = 13
    Caption = #8251' 2'#44032#51648' '#51333#47448#51032' '#45804#47141' '#54028#51068#51012' '#49373#49457#54624' '#49688' '#51080#49845#45768#45796'.'
  end
  object lblBlog: TLabel
    Left = 350
    Top = 478
    Width = 119
    Height = 13
    Hint = #48169#47928#54616#49492#49436' '#51025#50896#51032' '#44544#51060#45208' '#48320#44221#50836#52397' '#54644#51452#49464#50836'.'
    CustomHint = BalloonHint1
    Caption = 'http://blog.hjf.pe.kr/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = lblBlogClick
    OnMouseEnter = lblBlogMouseEnter
    OnMouseLeave = lblBlogMouseLeave
  end
  object Label1: TLabel
    Left = 80
    Top = 152
    Width = 51
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #45380#46020' '#48512#53552
  end
  object Label2: TLabel
    Left = 184
    Top = 152
    Width = 172
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #45380#46020' '#44620#51648#51032' '#45804#47141#51012' '#49373#49457' '#54633#45768#45796'.'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 461
    Height = 106
    Caption = #51020#47141'/'#50577#47141' '#48320#54872
    TabOrder = 0
    object 일: TLabel
      Left = 245
      Top = 25
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #51068
    end
    object Label8: TLabel
      Left = 245
      Top = 73
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #51068
    end
    object Label9: TLabel
      Left = 187
      Top = 25
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #50900
    end
    object Label10: TLabel
      Left = 187
      Top = 73
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #50900
    end
    object Label11: TLabel
      Left = 129
      Top = 25
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #45380
    end
    object Label12: TLabel
      Left = 129
      Top = 73
      Width = 12
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #45380
    end
    object Label13: TLabel
      Left = 31
      Top = 25
      Width = 24
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #51020#47141
    end
    object Label14: TLabel
      Left = 31
      Top = 73
      Width = 24
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #50577#47141
    end
    object btnLunarToSolar: TButton
      Left = 275
      Top = 21
      Width = 177
      Height = 25
      Caption = #51020#47141#51012' '#50577#47141#51004#47196' '#48320#54872
      TabOrder = 4
      OnClick = btnLunarToSolarClick
    end
    object edtLunarYear: TEdit
      Left = 81
      Top = 23
      Width = 43
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 4
      TabOrder = 0
      Text = '1980'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtLunarMonth: TEdit
      Left = 147
      Top = 23
      Width = 35
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 1
      Text = '12'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtLunarDay: TEdit
      Left = 208
      Top = 23
      Width = 35
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 2
      Text = '12'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object btnSolarToLunar: TButton
      Left = 275
      Top = 68
      Width = 177
      Height = 25
      Caption = #50577#47141#51012' '#51020#47141#51004#47196' '#48320#54872
      TabOrder = 8
      OnClick = btnSolarToLunarClick
    end
    object edtSolarYear: TEdit
      Left = 81
      Top = 70
      Width = 43
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 4
      TabOrder = 5
      Text = '1981'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtSolarMonth: TEdit
      Left = 147
      Top = 70
      Width = 35
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 6
      Text = '1'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtSolarDay: TEdit
      Left = 208
      Top = 70
      Width = 35
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 7
      Text = '17'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object chkLunarLeap: TCheckBox
      Left = 81
      Top = 49
      Width = 271
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #50948' '#51020#47141' '#51068#51088#44032' '#50980#45804#51064' '#44221#50864' '#49440#53469#54616#49464#50836'.'
      TabOrder = 3
    end
  end
  object pgcCalendar: TPageControl
    Left = 7
    Top = 171
    Width = 469
    Height = 301
    ActivePage = tsSpecified
    TabOrder = 3
    object tsLunar: TTabSheet
      Caption = #51020#47141' '#45804#47141' '#49373#49457
      DesignSize = (
        461
        273)
      object lblLunarDisplayDays10: TLabel
        Left = 42
        Top = 122
        Width = 319
        Height = 13
        Caption = #47588#50900' 1'#51068', 10'#51068', 20'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDays15: TLabel
        Left = 42
        Top = 170
        Width = 288
        Height = 13
        Caption = #47588#50900' 1'#51068', 15'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDays5: TLabel
        Left = 42
        Top = 219
        Width = 402
        Height = 13
        Caption = #47588#50900' 1'#51068', 5'#51068', 10'#51068', 15'#51068' 20'#51068', 25'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDaysKor: TLabel
        Left = 42
        Top = 65
        Width = 313
        Height = 26
        Caption = #47588#50900' '#50900#51060#47492'(1'#51068'), 5'#51068', 10'#51068', '#48372#47492', 20'#51068', 25'#51068', '#44536#48080'('#47568#51068')'#51060#13#10#54364#49884#46108' '#45804#47141#54028#51068#51060' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object Label6: TLabel
        Left = 3
        Top = 10
        Width = 354
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        Caption = #50500#47000' '#54637#47785' '#51473' '#51020#47141#45804#47141#50640' '#54364#49884#54624' '#51068#51088' '#54805#49885#51012' '#49440#53469#54616#44256' '#45804#47141#54028#51068'  '#49373#49457' '#48260#53948#51012' '#53364#47533#54616#49464#50836'.'
        WordWrap = True
      end
      object rdoLunarDisplayDays10: TRadioButton
        Left = 17
        Top = 99
        Width = 162
        Height = 16
        Caption = '10'#51068' '#44036#44201#51004#47196' '#54364#49884
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rdoLunarDisplayDays15: TRadioButton
        Left = 17
        Top = 147
        Width = 162
        Height = 17
        Caption = '15'#51068' '#44036#44201#51004#47196' '#54364#49884
        TabOrder = 1
      end
      object rdoLunarDisplayDays5: TRadioButton
        Left = 16
        Top = 197
        Width = 162
        Height = 17
        Caption = '5'#51068' '#44036#44201#51004#47196' '#54364#49884
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object rdoLunarDisplayDaysKor: TRadioButton
        Left = 16
        Top = 43
        Width = 162
        Height = 17
        Caption = #51020#47141#51060#47492#51004#47196' '#54364#49884
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        TabStop = True
      end
      object btnMakeLunarCalendar: TButton
        Left = 325
        Top = 245
        Width = 130
        Height = 25
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 4
        OnClick = btnMakeLunarCalendarClick
      end
    end
    object tsSpecified: TTabSheet
      Caption = #44592#45392#51068' '#45804#47141' '#49373#49457
      ImageIndex = 1
      DesignSize = (
        461
        273)
      object lblSpecified: TLabel
        Left = 3
        Top = 10
        Width = 243
        Height = 13
        Caption = #44060#51064#51201#51064' '#44592#45392#51068#51012' '#52628#44032#54616#50668' '#45804#47141' '#54028#51068#51012' '#49373#49457
      end
      object lvSpecified: TListView
        Left = 8
        Top = 48
        Width = 454
        Height = 202
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = #51020#47141#51068#51088
            MinWidth = 80
            Width = 100
          end
          item
            Caption = #44592#45392#51068' '#51333#47448
            Width = 400
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
        TabOrder = 2
        ViewStyle = vsReport
      end
      object btnAddSpecified: TButton
        Left = 325
        Top = 3
        Width = 62
        Height = 25
        Caption = #52628#44032
        TabOrder = 0
        OnClick = btnAddSpecifiedClick
      end
      object btnDelSpecified: TButton
        Left = 393
        Top = 3
        Width = 62
        Height = 25
        Caption = #49325#51228
        TabOrder = 1
      end
      object btnMakeSpecifiedCalendar: TButton
        Left = 325
        Top = 245
        Width = 130
        Height = 25
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 3
        OnClick = btnMakeSpecifiedCalendarClick
      end
    end
  end
  object edtStartOfRange: TEdit
    Left = 24
    Top = 147
    Width = 50
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 4
    TabOrder = 1
    OnKeyPress = edtOnlyNumericKeyPress
  end
  object edtEndOfRange: TEdit
    Left = 130
    Top = 147
    Width = 50
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 4
    TabOrder = 2
    OnKeyPress = edtOnlyNumericKeyPress
  end
  object btnAbout: TButton
    Left = 8
    Top = 472
    Width = 75
    Height = 25
    Caption = '&About'
    TabOrder = 4
    OnClick = btnAboutClick
  end
  object BalloonHint1: TBalloonHint
    Delay = 10
    Left = 384
    Top = 152
  end
  object dlgSave: TSaveDialog
    Filter = 'iCalendar(iPhone ical)|*.ics'
    Left = 416
    Top = 152
  end
end
