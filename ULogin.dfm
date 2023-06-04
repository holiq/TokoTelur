object FLogin: TFLogin
  Left = 0
  Top = 0
  ClientHeight = 379
  ClientWidth = 599
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 121
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'USSERNAME'
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = 'PASSWORD'
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 89
    Top = 128
    Width = 75
    Height = 25
    Caption = 'EXIT'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
