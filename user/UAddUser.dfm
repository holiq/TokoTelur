object FAddUser: TFAddUser
  Left = 0
  Top = 0
  ClientHeight = 413
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
    Top = 106
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object Label2: TLabel
    Left = 160
    Top = 162
    Width = 60
    Height = 13
    Caption = 'USSERNAME'
  end
  object Label3: TLabel
    Left = 160
    Top = 221
    Width = 26
    Height = 13
    Caption = 'ROLE'
  end
  object Label4: TLabel
    Left = 160
    Top = 280
    Width = 51
    Height = 13
    Caption = 'PASWORD'
  end
  object Label5: TLabel
    Left = 248
    Top = 40
    Width = 103
    Height = 18
    Caption = 'Add New User'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 160
    Top = 125
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object EditUsername: TEdit
    Left = 160
    Top = 181
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EditPassword: TEdit
    Left = 160
    Top = 299
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object ComboBoxRole: TComboBox
    Left = 160
    Top = 240
    Width = 145
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'owner'
      'admin')
  end
  object BitBtn1: TBitBtn
    Left = 206
    Top = 360
    Width = 75
    Height = 25
    Caption = 'SAVE'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 287
    Top = 360
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
