object Fpenjualan: TFpenjualan
  Left = 0
  Top = 0
  Caption = 'FPenjualan'
  ClientHeight = 372
  ClientWidth = 766
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 166
    Top = 72
    Width = 48
    Height = 13
    Caption = 'PRODUCT'
  end
  object Label2: TLabel
    Left = 166
    Top = 141
    Width = 61
    Height = 14
    Caption = 'QUANTITY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 166
    Top = 205
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label5: TLabel
    Left = 345
    Top = 27
    Width = 81
    Height = 21
    Caption = 'Penjualan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 233
    Top = 140
    Width = 71
    Height = 14
    Caption = '(Tersedia: 0)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditQty: TEdit
    Left = 166
    Top = 160
    Width = 257
    Height = 21
    TabOrder = 0
    OnChange = EditQtyChange
  end
  object BitBtn1: TBitBtn
    Left = 206
    Top = 279
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object EditPrice: TEdit
    Left = 166
    Top = 224
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 303
    Top = 279
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 166
    Top = 104
    Width = 218
    Height = 21
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object Panel1: TPanel
    Left = 456
    Top = 104
    Width = 265
    Height = 141
    TabOrder = 5
    object Label6: TLabel
      Left = 16
      Top = 16
      Width = 94
      Height = 19
      Caption = 'Total Harga: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 59
      Width = 50
      Height = 19
      Caption = 'Bayar: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 101
      Width = 84
      Height = 19
      Caption = 'Kembalian: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EditTotal: TEdit
      Left = 116
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EditBayar: TEdit
      Left = 120
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = EditBayarChange
    end
    object EditKembalian: TEdit
      Left = 120
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object QProduct: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT id, name, price_kg, stock_kg FROM products')
    Left = 80
    Top = 165
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
    object QProductprice_kg: TIntegerField
      FieldName = 'price_kg'
      Origin = 'price_kg'
      Required = True
    end
    object QProductstock_kg: TIntegerField
      FieldName = 'stock_kg'
      Origin = 'stock_kg'
      Required = True
    end
  end
end
