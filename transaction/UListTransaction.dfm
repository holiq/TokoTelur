object FListTransaction: TFListTransaction
  Left = 0
  Top = 0
  Caption = 'FListTransaction'
  ClientHeight = 311
  ClientWidth = 547
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 35
    Align = alTop
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
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
    end
    object BitBtn2: TBitBtn
      Left = 82
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'RESTOCK'
      TabOrder = 2
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
    Width = 547
    Height = 30
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 226
      Top = 6
      Width = 87
      Height = 18
      Caption = 'List Product'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 44
      Height = 22
      Align = alLeft
      Caption = 'SEARCH:'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Edit1: TEdit
      Left = 54
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 272
    Width = 547
    Height = 39
    Align = alBottom
    TabOrder = 2
    object BitBtn5: TBitBtn
      Left = 471
      Top = 1
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'CLOSE'
      TabOrder = 0
      OnClick = BitBtn5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 547
    Height = 207
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price_kg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'created_at'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'updated_at'
        Visible = True
      end>
  end
  object QTransaction: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      
        'SELECT transactions.id, full_name, name AS product_name, quantit' +
        'y, transactions.price_kg, transactions.total_price, transactions' +
        '.type, transactions.created_at, transactions.updated_at FROM tra' +
        'nsactions INNER JOIN users ON transactions.user_id = users.id IN' +
        'NER JOIN products ON transactions.product_id = products.id'
      '&WHERE')
    Left = 192
    Top = 160
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end>
    object QTransactionid: TFDAutoIncField
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
    object QTransactioncreated_at: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QTransactionupdated_at: TDateTimeField
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
end
