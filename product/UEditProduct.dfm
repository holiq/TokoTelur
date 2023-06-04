object FEditProduct: TFEditProduct
  Left = 0
  Top = 0
  ClientHeight = 351
  ClientWidth = 575
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
    Left = 160
    Top = 90
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object Label2: TLabel
    Left = 160
    Top = 146
    Width = 33
    Height = 13
    Caption = 'STOCK'
  end
  object Label3: TLabel
    Left = 160
    Top = 210
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 232
    Top = 24
    Width = 89
    Height = 18
    Caption = 'Edit Product'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object LID: TLabel
    Left = 336
    Top = 24
    Width = 18
    Height = 18
    Caption = 'ID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 160
    Top = 109
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object EditStock: TEdit
    Left = 160
    Top = 165
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EditPrice: TEdit
    Left = 160
    Top = 229
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 246
    Top = 296
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 327
    Top = 296
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
