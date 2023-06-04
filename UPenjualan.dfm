object Fpenjualan: TFpenjualan
  Left = 0
  Top = 0
  Caption = 'FPenjualan'
  ClientHeight = 367
  ClientWidth = 563
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 53
    Width = 48
    Height = 13
    Caption = 'PRODUCT'
  end
  object Label2: TLabel
    Left = 160
    Top = 109
    Width = 51
    Height = 13
    Caption = 'QUANTITY'
  end
  object Label3: TLabel
    Left = 160
    Top = 173
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 248
    Top = 16
    Width = 69
    Height = 18
    Caption = 'Penjualan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 160
    Top = 223
    Width = 65
    Height = 13
    Caption = 'TOTAL PRICE'
  end
  object EditQty: TEdit
    Left = 160
    Top = 128
    Width = 257
    Height = 21
    TabOrder = 0
    OnChange = EditQtyChange
  end
  object BitBtn1: TBitBtn
    Left = 214
    Top = 304
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object EditPrice: TEdit
    Left = 160
    Top = 192
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 295
    Top = 304
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 72
    Width = 210
    Height = 21
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object EditTotal: TEdit
    Left = 160
    Top = 242
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object QProduct: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT id, name, stock_kg, price_kg FROM products')
    Left = 56
    Top = 88
    object QProductid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
  end
end
