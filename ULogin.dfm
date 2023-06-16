object FLogin: TFLogin
  Left = 0
  Top = 0
  ClientHeight = 361
  ClientWidth = 589
  Color = clHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 84
    Width = 72
    Height = 19
    Caption = 'Username '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 232
    Top = 139
    Width = 67
    Height = 19
    Caption = 'Password '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 232
    Top = 112
    Width = 137
    Height = 21
    Color = clHighlight
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 232
    Top = 160
    Width = 137
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Login'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 329
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
