object FListProduct: TFListProduct
  Left = 0
  Top = 0
  ClientHeight = 392
  ClientWidth = 570
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 357
    Width = 570
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 358
    ExplicitWidth = 624
    object BitBtn1: TBitBtn
      Left = 497
      Top = 1
      Width = 72
      Height = 33
      Align = alRight
      Caption = 'CLOSE'
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitLeft = 551
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 35
    Align = alTop
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 588
    object Splitter1: TSplitter
      Left = 79
      Top = 1
      Height = 33
      ExplicitLeft = 280
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object Splitter2: TSplitter
      Left = 157
      Top = 1
      Height = 33
      ExplicitLeft = 280
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object Splitter3: TSplitter
      Left = 235
      Top = 1
      Height = 33
      ExplicitLeft = 240
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object Splitter4: TSplitter
      Left = 1
      Top = 1
      Height = 33
      ExplicitTop = 2
      ExplicitHeight = 39
    end
    object BtnAdd: TBitBtn
      Left = 4
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'NEW'
      TabOrder = 0
      OnClick = BtnAddClick
    end
    object BtnEdit: TBitBtn
      Left = 82
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'EDIT'
      TabOrder = 1
      OnClick = BtnEditClick
    end
    object BtnRefresh: TBitBtn
      Left = 160
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'REFRESH'
      TabOrder = 2
      OnClick = BtnRefreshClick
    end
    object BtnDelete: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'DELETE'
      TabOrder = 3
      OnClick = BtnDeleteClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 70
    Width = 570
    Height = 287
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
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
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nama'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock_kg'
        Title.Caption = 'Stok/kg'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price_kg'
        Title.Caption = 'Harga'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'created_at'
        Title.Caption = 'Tanggal'
        Width = 160
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 35
    Width = 570
    Height = 35
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 624
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 37
      Height = 27
      Align = alLeft
      Caption = 'Search:'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Label4: TLabel
      Left = 250
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
    object EditSearch: TEdit
      Left = 46
      Top = 6
      Width = 125
      Height = 21
      TabOrder = 0
      OnChange = EditSearchChange
    end
  end
  object QProduct: TFDQuery
    AggregatesActive = True
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM products'
      '&WHERE')
    Left = 88
    Top = 248
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
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
    object QProductprice_kg: TIntegerField
      FieldName = 'price_kg'
      Origin = 'price_kg'
      Required = True
    end
    object QProductcreated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QProductupdated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = QProduct
    Left = 208
    Top = 280
  end
end
