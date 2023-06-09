object FListUser: TFListUser
  Left = 0
  Top = 0
  Caption = 'DataModule.FDConnection1'
  ClientHeight = 411
  ClientWidth = 634
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 35
    Align = alTop
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 624
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 33
      ExplicitTop = 2
      ExplicitHeight = 39
    end
    object Splitter2: TSplitter
      Left = 79
      Top = 1
      Height = 33
      ExplicitLeft = 280
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object Splitter3: TSplitter
      Left = 157
      Top = 1
      Height = 33
      ExplicitLeft = 280
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object Splitter4: TSplitter
      Left = 235
      Top = 1
      Height = 33
      ExplicitLeft = 280
      ExplicitTop = -32
      ExplicitHeight = 100
    end
    object BtnAdd: TBitBtn
      Left = 4
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'NEW'
      TabOrder = 0
      OnClick = BtnAddClick
    end
    object BtnEdit: TBitBtn
      Left = 82
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'EDIT'
      TabOrder = 1
      OnClick = BtnEditClick
    end
    object BtnRefresh: TBitBtn
      Left = 160
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'REFRESH'
      TabOrder = 2
      OnClick = BtnRefreshClick
    end
    object BtnDelete: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'DELETE'
      TabOrder = 3
      OnClick = BtnDeleteClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 35
    Width = 634
    Height = 35
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 624
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 37
      Height = 27
      Align = alLeft
      Caption = 'Search:'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Label4: TLabel
      Left = 258
      Top = 8
      Width = 65
      Height = 18
      Caption = 'List User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Georgia'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 47
      Top = 6
      Width = 125
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 376
    Width = 634
    Height = 35
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 358
    ExplicitWidth = 624
    object BitBtn5: TBitBtn
      Left = 558
      Top = 1
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'CLOSE'
      TabOrder = 0
      OnClick = BitBtn5Click
      ExplicitLeft = 548
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 70
    Width = 634
    Height = 306
    Align = alClient
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'username'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'role'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'password'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'created_at'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'updated_at'
        Visible = True
      end>
  end
  object QUser: TFDQuery
    Connection = DataModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM users'
      '&WHERE')
    Left = 184
    Top = 208
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end>
    object QUserid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QUserfull_name: TStringField
      FieldName = 'full_name'
      Origin = 'full_name'
      Required = True
      Size = 255
    end
    object QUserusername: TStringField
      FieldName = 'username'
      Origin = 'username'
      Required = True
      Size = 255
    end
    object QUserrole: TStringField
      FieldName = 'role'
      Origin = 'role'
      Required = True
      Size = 255
    end
    object QUserpassword: TStringField
      FieldName = 'password'
      Origin = 'password'
      Required = True
      Size = 255
    end
    object QUsercreated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QUserupdated_at: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = QUser
    Left = 440
    Top = 272
  end
end
