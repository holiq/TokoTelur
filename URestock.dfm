object Frestock: TFrestock
  Left = 0
  Top = 0
  Caption = 'Frestock'
  ClientHeight = 458
  ClientWidth = 586
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
    Top = 98
    Width = 48
    Height = 13
    Caption = 'PRODUCT'
  end
  object Label2: TLabel
    Left = 160
    Top = 154
    Width = 51
    Height = 13
    Caption = 'QUANTITY'
  end
  object Label3: TLabel
    Left = 160
    Top = 218
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 160
    Top = 282
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
  object Edit2: TEdit
    Left = 160
    Top = 173
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 206
    Top = 416
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 160
    Top = 237
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 160
    Top = 301
    Width = 257
    Height = 21
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 303
    Top = 416
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 117
    Width = 218
    Height = 21
    TabOrder = 5
  end
end
