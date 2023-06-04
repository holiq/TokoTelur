object FAddProduct: TFAddProduct
  Left = 0
  Top = 0
  ClientHeight = 340
  ClientWidth = 562
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
  object Label1: TLabel
    Left = 144
    Top = 90
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object Label2: TLabel
    Left = 144
    Top = 146
    Width = 33
    Height = 13
    Caption = 'STOCK'
  end
  object Label3: TLabel
    Left = 144
    Top = 210
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 216
    Top = 16
    Width = 125
    Height = 18
    Caption = 'Add New Product'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 144
    Top = 109
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object EditStock: TEdit
    Left = 144
    Top = 165
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EditPrice: TEdit
    Left = 144
    Top = 229
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 230
    Top = 296
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 311
    Top = 296
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
