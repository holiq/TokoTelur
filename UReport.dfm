object FReport: TFReport
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Splitter4: TSplitter
    Left = 365
    Top = 63
    Height = 270
    ExplicitLeft = 257
    ExplicitTop = 1
    ExplicitHeight = 282
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 33
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 724
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 31
      ExplicitLeft = 8
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Splitter2: TSplitter
      Left = 79
      Top = 1
      Height = 31
    end
    object Splitter3: TSplitter
      Left = 157
      Top = 1
      Height = 31
      ExplicitLeft = 166
    end
    object Splitter5: TSplitter
      Left = 235
      Top = 1
      Height = 31
      ExplicitLeft = 240
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Splitter6: TSplitter
      Left = 313
      Top = 1
      Height = 31
      ExplicitLeft = 336
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'HARIAN'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 82
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'MINGGUAN'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 160
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'BULANAN'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'TAHUNAN'
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 316
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'KESELURUHAN'
      TabOrder = 4
      OnClick = BitBtn5Click
    end
  end
  object SplitView1: TSplitView
    Left = 0
    Top = 63
    Width = 365
    Height = 270
    OpenedWidth = 365
    Placement = svpLeft
    TabOrder = 1
    ExplicitHeight = 252
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 359
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Penjualan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 69
    end
    object Memo1: TMemo
      Left = 0
      Top = 25
      Width = 365
      Height = 245
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 227
    end
  end
  object SplitView2: TSplitView
    Left = 368
    Top = 63
    Width = 365
    Height = 270
    OpenedWidth = 365
    Placement = svpLeft
    TabOrder = 2
    ExplicitHeight = 252
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 359
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Restock'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 54
    end
    object Memo2: TMemo
      Left = 0
      Top = 25
      Width = 365
      Height = 245
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 227
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 734
    Height = 30
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 724
    object Label3: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 31
      Height = 22
      Align = alLeft
      Caption = 'Filter: '
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Splitter7: TSplitter
      Left = 38
      Top = 1
      Height = 28
      ExplicitLeft = 41
      ExplicitTop = 6
    end
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 44
      Top = 4
      Width = 145
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = 'Semua'
    end
  end
  object QTransaction: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM transactions'
      '&WHERE')
    Left = 280
    Top = 215
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end>
  end
end
