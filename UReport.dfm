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
    Top = 33
    Height = 300
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
    end
    object BitBtn3: TBitBtn
      Left = 160
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'BULANAN'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'TAHUNAN'
      TabOrder = 3
    end
  end
  object SplitView1: TSplitView
    Left = 0
    Top = 33
    Width = 365
    Height = 300
    OpenedWidth = 365
    Placement = svpLeft
    TabOrder = 1
    ExplicitHeight = 282
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
      Height = 275
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 257
    end
  end
  object SplitView2: TSplitView
    Left = 368
    Top = 33
    Width = 365
    Height = 300
    OpenedWidth = 365
    Placement = svpLeft
    TabOrder = 2
    ExplicitHeight = 282
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
      Height = 275
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 257
    end
  end
  object QPenjualan: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      
        'SELECT transactions.id, name AS product_name, quantity, transact' +
        'ions.price_kg, transactions.total_price, transactions.type, tran' +
        'sactions.created_at, transactions.updated_at FROM transactions I' +
        'NNER JOIN users ON transactions.user_id = users.id INNER JOIN pr' +
        'oducts ON transactions.product_id = products.id WHERE transactio' +
        'ns.type='#39'penjualan'#39' ORDER BY transactions.id DESC')
    Left = 152
    Top = 209
  end
  object QRestock: TFDQuery
    Connection = DataModule.FDConnection1
    Left = 521
    Top = 217
  end
end
