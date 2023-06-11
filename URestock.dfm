object FRestock: TFRestock
  Left = 0
  Top = 0
  Caption = 'FRestock'
  ClientHeight = 372
  ClientWidth = 568
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
    Left = 160
    Top = 54
    Width = 48
    Height = 13
    Caption = 'PRODUCT'
  end
  object Label2: TLabel
    Left = 160
    Top = 110
    Width = 51
    Height = 13
    Caption = 'QUANTITY'
  end
  object Label3: TLabel
    Left = 160
    Top = 174
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 160
    Top = 238
    Width = 65
    Height = 13
    Caption = 'TOTAL PRICE'
  end
  object Label5: TLabel
    Left = 256
    Top = 16
    Width = 56
    Height = 18
    Caption = 'Restock'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object EditQty: TEdit
    Left = 160
    Top = 129
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 202
    Top = 313
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object EditPrice: TEdit
    Left = 160
    Top = 193
    Width = 257
    Height = 21
    TabOrder = 2
    OnChange = EditPriceChange
  end
  object EditTotal: TEdit
    Left = 160
    Top = 257
    Width = 257
    Height = 21
    TabOrder = 3
    OnChange = EditTotalChange
  end
  object BitBtn2: TBitBtn
    Left = 299
    Top = 313
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 73
    Width = 218
    Height = 21
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object QProduct: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT id, name, stock_kg FROM products')
    Left = 88
    Top = 168
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
