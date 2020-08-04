object frmCalculator: TfrmCalculator
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 208
  ClientWidth = 224
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCalculator: TPanel
    Left = 0
    Top = 2
    Width = 356
    Height = 209
    Align = alCustom
    BevelOuter = bvNone
    Color = clGradientInactiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Image1: TImage
      Left = 168
      Top = 7
      Width = 105
      Height = 105
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000001E0000
        001E08060000003B30AEA200000006624B474400FF00FF00FFA0BDA793000000
        F54944415478DAEDD64D0A01611CC7F1677205C209C64B168EA1284B49D811F7
        9185529616943D6E800370015798C26FEA3FF52C9ECCF33233CF2C9E7F7D5346
        3E9E6718E3314BE339D8C179801BA867E86DD15B05AEA30BAA18C26DF490855B
        E88C4A688F6E1AE098764C1AE657BA4133F4D1808FA82F0B27852AC17168078D
        D01405F45C19EDD0123D7560FE9CAED1027DB9E30574A7D71DD00015D115F968
        45B8121C874653E5A0133DFADC070954E026BD591C2AC2D91F34BFB0B5AD96C5
        53F972C9E25D3444136E75E12E843FA7397AE9C2E1D46815995E40A2B172C914
        6D7B667F12A2959B8C32CC98A51B81C4C7C10E4E6D7ED6436A1F2F80E3230000
        000049454E44AE426082}
      OnDblClick = pnlDeleteClick
    end
    object pnl7: TPanel
      Left = 0
      Top = 28
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '7'
      TabOrder = 0
      OnClick = pnl7Click
    end
    object pnl8: TPanel
      Left = 45
      Top = 28
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '8'
      TabOrder = 1
      OnClick = pnl8Click
    end
    object pnl9: TPanel
      Left = 90
      Top = 28
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '9'
      TabOrder = 2
      OnClick = pnl9Click
    end
    object pnl6: TPanel
      Left = 90
      Top = 73
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '6'
      TabOrder = 3
      OnClick = pnl6Click
    end
    object pnl4: TPanel
      Left = 0
      Top = 73
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '4'
      TabOrder = 4
      OnClick = pnl4Click
    end
    object pnl5: TPanel
      Left = 45
      Top = 73
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '5'
      TabOrder = 5
      OnClick = pnl5Click
    end
    object pnl1: TPanel
      Left = 0
      Top = 118
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '1'
      TabOrder = 6
      OnClick = pnl1Click
    end
    object pnl2: TPanel
      Left = 45
      Top = 118
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '2'
      TabOrder = 7
      OnClick = pnl2Click
    end
    object pnl3: TPanel
      Left = 90
      Top = 118
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '3'
      TabOrder = 8
      OnClick = pnl3Click
    end
    object pnl0: TPanel
      Left = 0
      Top = 163
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '0'
      TabOrder = 9
      OnClick = pnl0Click
    end
    object pnlPoint: TPanel
      Left = 45
      Top = 163
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '.'
      TabOrder = 10
      OnClick = pnlPointClick
    end
    object pnlDelit: TPanel
      Left = 135
      Top = 28
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '/'
      TabOrder = 11
      OnClick = pnlDelitClick
    end
    object pnlUmnozit: TPanel
      Left = 135
      Top = 73
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '*'
      TabOrder = 12
      OnClick = pnlUmnozitClick
    end
    object pnlPlus: TPanel
      Left = 135
      Top = 118
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '+'
      TabOrder = 13
      OnClick = pnlPlusClick
    end
    object pnlMinus: TPanel
      Left = 135
      Top = 163
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '-'
      TabOrder = 14
      OnClick = pnlMinusClick
    end
    object pnlRovno: TPanel
      Left = 180
      Top = 163
      Width = 45
      Height = 45
      BevelWidth = 2
      Caption = '='
      TabOrder = 15
      OnClick = pnlRovnoClick
    end
    object pnlDelete: TPanel
      Left = 180
      Top = 28
      Width = 45
      Height = 45
      BevelWidth = 2
      TabOrder = 16
      OnClick = pnlDeleteClick
    end
  end
  object editVVodNumber: TEdit
    Left = 0
    Top = 0
    Width = 224
    Height = 30
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clGradientActiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    StyleElements = []
  end
end
