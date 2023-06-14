object FEditProduct: TFEditProduct
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
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 113
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object Label2: TLabel
    Left = 160
    Top = 169
    Width = 33
    Height = 13
    Caption = 'STOCK'
  end
  object Label3: TLabel
    Left = 160
    Top = 233
    Width = 47
    Height = 13
    Caption = 'PRICE/KG'
  end
  object Label4: TLabel
    Left = 225
    Top = 39
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
    Left = 327
    Top = 39
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
    Top = 132
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object EditStock: TEdit
    Left = 160
    Top = 188
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EditPrice: TEdit
    Left = 160
    Top = 252
    Width = 257
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 261
    Top = 294
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 342
    Top = 294
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
