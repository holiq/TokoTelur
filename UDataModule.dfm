object DataModule: TDataModule
  Left = 0
  Top = 0
  Caption = 'DataModule'
  ClientHeight = 306
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QTemp: TFDQuery
    Connection = FDConnection1
    Left = 272
    Top = 152
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=toko_telur'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 128
  end
end
