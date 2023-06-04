object FEditUser: TFEditUser
  Left = 0
  Top = 0
  ClientHeight = 401
  ClientWidth = 550
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
    Top = 93
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object Label2: TLabel
    Left = 160
    Top = 149
    Width = 60
    Height = 13
    Caption = 'USSERNAME'
  end
  object Label3: TLabel
    Left = 160
    Top = 208
    Width = 26
    Height = 13
    Caption = 'ROLE'
  end
  object Label4: TLabel
    Left = 160
    Top = 267
    Width = 51
    Height = 13
    Caption = 'PASWORD'
  end
  object Label5: TLabel
    Left = 232
    Top = 24
    Width = 67
    Height = 18
    Caption = 'Edit User'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
  end
  object LID: TLabel
    Left = 305
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
    Top = 112
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object EditUsername: TEdit
    Left = 160
    Top = 168
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EditPassword: TEdit
    Left = 160
    Top = 286
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object ComboBoxRole: TComboBox
    Left = 160
    Top = 227
    Width = 145
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'owner'
      'admin')
  end
  object BtnUpdate: TBitBtn
    Left = 190
    Top = 339
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 4
    OnClick = BtnUpdateClick
  end
  object BtnClose: TBitBtn
    Left = 271
    Top = 339
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 5
    OnClick = BtnCloseClick
  end
end
