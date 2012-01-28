object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'hjLunarCalendarGenerator :: '#51020#47141#45804#47141' '#49373#49457#44592
  ClientHeight = 667
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object Label5: TLabel
    Left = 10
    Top = 167
    Width = 306
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #8251' 2'#44032#51648' '#51333#47448#51032' '#45804#47141' '#54028#51068#51012' '#49373#49457#54624' '#49688' '#51080#49845#45768#45796'.'
  end
  object lblBlog: TLabel
    Left = 458
    Top = 625
    Width = 163
    Height = 18
    Hint = #48169#47928#54616#49492#49436' '#51025#50896#51032' '#44544#51060#45208' '#48320#44221#50836#52397' '#54644#51452#49464#50836'.'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    CustomHint = BalloonHint1
    Caption = 'http://blog.hjf.pe.kr/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = lblBlogClick
    OnMouseEnter = lblBlogMouseEnter
    OnMouseLeave = lblBlogMouseLeave
  end
  object lblCopyright: TLabel
    Left = 7
    Top = 625
    Width = 370
    Height = 17
    Hint = #45944#54028#51060' '#47564#49744'~~'
    CustomHint = BalloonHint1
    Caption = #51060' '#54532#47196#44536#47016#51008' '#47924#47308#54532#47196#44536#47016#51060#47728' '#45944#54028#51060#47196' '#51228#51089#46104#50632#49845#45768#45796'.'
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Left = 105
    Top = 199
    Width = 60
    Height = 17
    Caption = #45380#46020' '#48512#53552
  end
  object Label2: TLabel
    Left = 241
    Top = 199
    Width = 202
    Height = 17
    Caption = #45380#46020' '#44620#51648#51032' '#45804#47141#51012' '#49373#49457' '#54633#45768#45796'.'
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 9
    Width = 603
    Height = 139
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #51020#47141'/'#50577#47141' '#48320#54872
    TabOrder = 0
    object 일: TLabel
      Left = 320
      Top = 33
      Width = 14
      Height = 17
      Caption = #51068
    end
    object Label8: TLabel
      Left = 320
      Top = 95
      Width = 14
      Height = 17
      Caption = #51068
    end
    object Label9: TLabel
      Left = 245
      Top = 33
      Width = 14
      Height = 17
      Caption = #50900
    end
    object Label10: TLabel
      Left = 245
      Top = 95
      Width = 14
      Height = 17
      Caption = #50900
    end
    object Label11: TLabel
      Left = 169
      Top = 33
      Width = 14
      Height = 17
      Caption = #45380
    end
    object Label12: TLabel
      Left = 169
      Top = 95
      Width = 14
      Height = 17
      Caption = #45380
    end
    object Label13: TLabel
      Left = 41
      Top = 33
      Width = 28
      Height = 17
      Caption = #51020#47141
    end
    object Label14: TLabel
      Left = 41
      Top = 95
      Width = 28
      Height = 17
      Caption = #50577#47141
    end
    object btnLunarToSolar: TButton
      Left = 360
      Top = 27
      Width = 231
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #51020#47141#51012' '#50577#47141#51004#47196' '#48320#54872
      TabOrder = 4
      OnClick = btnLunarToSolarClick
    end
    object edtLunarYear: TEdit
      Left = 106
      Top = 30
      Width = 56
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 4
      TabOrder = 0
      Text = '1980'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtLunarMonth: TEdit
      Left = 192
      Top = 30
      Width = 46
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 1
      Text = '12'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtLunarDay: TEdit
      Left = 272
      Top = 30
      Width = 46
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 2
      Text = '12'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object btnSolarToLunar: TButton
      Left = 360
      Top = 89
      Width = 231
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #50577#47141#51012' '#51020#47141#51004#47196' '#48320#54872
      TabOrder = 8
      OnClick = btnSolarToLunarClick
    end
    object edtSolarYear: TEdit
      Left = 106
      Top = 92
      Width = 56
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 4
      TabOrder = 5
      Text = '1981'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtSolarMonth: TEdit
      Left = 192
      Top = 92
      Width = 46
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 6
      Text = '1'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object edtSolarDay: TEdit
      Left = 272
      Top = 92
      Width = 46
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 2
      TabOrder = 7
      Text = '17'
      OnKeyPress = edtOnlyNumericKeyPress
    end
    object chkLunarLeap: TCheckBox
      Left = 106
      Top = 64
      Width = 354
      Height = 17
      Caption = #50948' '#51020#47141' '#51068#51088#44032' '#50980#45804#51064' '#44221#50864' '#49440#53469#54616#49464#50836'.'
      TabOrder = 3
    end
  end
  object pgcCalendar: TPageControl
    Left = 9
    Top = 224
    Width = 610
    Height = 393
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsLunar
    TabOrder = 3
    object tsLunar: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #51020#47141' '#45804#47141' '#49373#49457
      object lblLunarDisplayDays10: TLabel
        Left = 55
        Top = 93
        Width = 378
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47588#50900' 1'#51068', 10'#51068', 20'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDays15: TLabel
        Left = 55
        Top = 156
        Width = 340
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47588#50900' 1'#51068', 15'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDays5: TLabel
        Left = 55
        Top = 218
        Width = 480
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47588#50900' 1'#51068', 5'#51068', 10'#51068', 15'#51068' 20'#51068', 25'#51068', '#47568#51068#51060' '#54364#49884#46108' '#45804#47141#54028#51068#51012' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object lblLunarDisplayDaysKor: TLabel
        Left = 55
        Top = 281
        Width = 374
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47588#50900' '#50900#51060#47492'(1'#51068'), 5'#51068', 10'#51068', '#48372#47492', 20'#51068', 25'#51068', '#44536#48080'('#47568#51068')'#51060#13#10#54364#49884#46108' '#45804#47141#54028#51068#51060' '#49373#49457#54633#45768#45796'.'
        OnClick = lblLunarDisplayDaysClick
      end
      object Label6: TLabel
        Left = 4
        Top = 13
        Width = 400
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #50500#47000' '#54637#47785' '#51473' '#51020#47141#45804#47141#50640' '#54364#49884#54624' '#51068#51088' '#54805#49885#51012' '#49440#53469#54616#44256' '#45804#47141#54028#51068' '#13#10#49373#49457' '#48260#53948#51012' '#53364#47533#54616#49464#50836'.'
      end
      object rdoLunarDisplayDays10: TRadioButton
        Left = 22
        Top = 63
        Width = 212
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '10'#51068' '#44036#44201#51004#47196' '#54364#49884
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rdoLunarDisplayDays15: TRadioButton
        Left = 22
        Top = 126
        Width = 212
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '15'#51068' '#44036#44201#51004#47196' '#54364#49884
        TabOrder = 1
      end
      object rdoLunarDisplayDays5: TRadioButton
        Left = 22
        Top = 188
        Width = 212
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '5'#51068' '#44036#44201#51004#47196' '#54364#49884
        TabOrder = 2
      end
      object rdoLunarDisplayDaysKor: TRadioButton
        Left = 22
        Top = 251
        Width = 212
        Height = 22
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #51020#47141#51060#47492#51004#47196' '#54364#49884
        TabOrder = 3
      end
      object btnMakeLunarCalendar: TButton
        Left = 425
        Top = 320
        Width = 170
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 4
        OnClick = btnMakeLunarCalendarClick
      end
    end
    object tsSpecified: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #44592#45392#51068' '#45804#47141' '#49373#49457
      ImageIndex = 1
      object lblSpecified: TLabel
        Left = 4
        Top = 13
        Width = 286
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #44060#51064#51201#51064' '#44592#45392#51068#51012' '#52628#44032#54616#50668' '#45804#47141' '#54028#51068#51012' '#49373#49457
      end
      object lvSpecified: TListView
        Left = 4
        Top = 48
        Width = 445
        Height = 190
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Left = 425
        Top = 4
        Width = 81
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #52628#44032
        TabOrder = 0
      end
      object btnDelSpecified: TButton
        Left = 514
        Top = 4
        Width = 81
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #49325#51228
        TabOrder = 1
      end
      object btnMakeSpecifiedCalendar: TButton
        Left = 425
        Top = 320
        Width = 170
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #45804#47141#54028#51068' '#49373#49457
        TabOrder = 3
        OnClick = btnMakeSpecifiedCalendarClick
      end
    end
  end
  object edtStartOfRange: TEdit
    Left = 31
    Top = 192
    Width = 66
    Height = 25
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 4
    TabOrder = 1
    OnKeyPress = edtOnlyNumericKeyPress
  end
  object edtEndOfRange: TEdit
    Left = 170
    Top = 192
    Width = 65
    Height = 25
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 4
    TabOrder = 2
    OnKeyPress = edtOnlyNumericKeyPress
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
