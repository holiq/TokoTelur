object FListTransaction: TFListTransaction
  Left = 0
  Top = 0
  Caption = 'FListTransaction'
  ClientHeight = 470
  ClientWidth = 743
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 35
    Align = alTop
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 775
    object Splitter4: TSplitter
      Left = 157
      Top = 1
      Height = 33
      ExplicitLeft = 1
      ExplicitTop = -4
    end
    object Splitter3: TSplitter
      Left = 235
      Top = 1
      Height = 33
      ExplicitLeft = 272
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object Splitter1: TSplitter
      Left = 79
      Top = 1
      Height = 33
      ExplicitLeft = 76
      ExplicitTop = 2
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 1
      Height = 33
      ExplicitTop = 2
    end
    object BtnRefresh: TBitBtn
      Left = 160
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'REFRESH'
      TabOrder = 0
      OnClick = BtnRefreshClick
    end
    object BitBtn4: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'DELETE'
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn2: TBitBtn
      Left = 82
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'RESTOCK'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 4
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'PENJUALAN'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 35
    Width = 743
    Height = 30
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 785
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 48
      Height = 22
      Align = alLeft
      Caption = 'SEARCH:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 14
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 185
      Top = 4
      Width = 48
      Height = 22
      Align = alLeft
      Caption = 'FILTER: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 181
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 58
      Top = 4
      Width = 121
      Height = 22
      Align = alLeft
      TabOrder = 0
      OnChange = Edit1Change
      ExplicitLeft = 54
      ExplicitTop = 6
      ExplicitHeight = 21
    end
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 239
      Top = 4
      Width = 137
      Height = 21
      Align = alLeft
      TabOrder = 1
      OnChange = ComboBox1Change
      ExplicitLeft = 240
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 431
    Width = 743
    Height = 39
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 413
    ExplicitWidth = 775
    object BitBtn5: TBitBtn
      Left = 667
      Top = 1
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'CLOSE'
      TabOrder = 0
      OnClick = BitBtn5Click
      ExplicitLeft = 699
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 99
    Width = 743
    Height = 291
    Align = alClient
    BiDiMode = bdLeftToRight
    DataSource = DataSource1
    ParentBiDiMode = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_name'
        Title.Caption = 'Nama'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Title.Caption = 'Produk'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Title.Caption = 'Jumlah'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price_kg'
        Title.Caption = 'Harga/kg'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_price'
        Title.Caption = 'Total  Harga'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = 'Tipe'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'created_at'
        Title.Caption = 'Tanggal'
        Width = 150
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 390
    Width = 743
    Height = 41
    Align = alBottom
    Color = clCream
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 372
    ExplicitWidth = 775
    object Splitter5: TSplitter
      Left = 664
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 700
      ExplicitTop = -3
    end
    object BtnNext: TBitBtn
      Left = 667
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'NEXT'
      TabOrder = 0
      OnClick = BtnNextClick
      ExplicitLeft = 699
    end
    object BtnPrevious: TBitBtn
      Left = 589
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'PREVIOUS'
      TabOrder = 1
      OnClick = BtnPreviousClick
      ExplicitLeft = 621
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 65
    Width = 743
    Height = 34
    Align = alTop
    TabOrder = 5
    ExplicitTop = 43
    ExplicitWidth = 785
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 741
      Height = 32
      Align = alClient
      Alignment = taCenter
      Caption = 'List Transaction'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 314
      ExplicitTop = 6
      ExplicitWidth = 115
      ExplicitHeight = 18
    end
  end
  object QTransaction: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      
        'SELECT transactions.id, full_name, name AS product_name, quantit' +
        'y, transactions.price_kg, transactions.total_price, transactions' +
        '.type, transactions.created_at, transactions.updated_at FROM tra' +
        'nsactions INNER JOIN users ON transactions.user_id = users.id IN' +
        'NER JOIN products ON transactions.product_id = products.id'
      '&WHERELIMIT')
    Left = 192
    Top = 160
    MacroData = <
      item
        Value = Null
        Name = 'WHERELIMIT'
      end>
    object QTransactionid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QTransactionfull_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'full_name'
      Origin = 'full_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QTransactionproduct_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'product_name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QTransactionquantity: TIntegerField
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
    end
    object QTransactionprice_kg: TIntegerField
      FieldName = 'price_kg'
      Origin = 'price_kg'
      Required = True
    end
    object QTransactiontotal_price: TIntegerField
      FieldName = 'total_price'
      Origin = 'total_price'
      Required = True
    end
    object QTransactiontype: TStringField
      FieldName = 'type'
      Origin = 'type'
      Required = True
      Size = 255
    end
    object QTransactioncreated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QTransactionupdated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = QTransaction
    Left = 416
    Top = 184
  end
  object QProduct: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT id, name, stock_kg FROM products')
    Left = 104
    Top = 160
    object QProductid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QProductname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      Size = 255
    end
    object QProductstock_kg: TIntegerField
      FieldName = 'stock_kg'
      Origin = 'stock_kg'
      Required = True
    end
  end
end
