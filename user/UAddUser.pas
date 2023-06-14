unit UAddUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFAddUser = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditName: TEdit;
    EditUsername: TEdit;
    EditPassword: TEdit;
    ComboBoxRole: TComboBox;
    BtnUpdate: TBitBtn;
    BtnClose: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddUser: TFAddUser;

implementation

{$R *.dfm}

uses UDataModule, UListUser, UFunction;

procedure TFAddUser.BitBtn1Click(Sender: TObject);
begin
  with DataModule.QTemp do
  begin;
    Close;
    SQL.Clear;
    SQL.Text:= 'INSERT INTO toko_telur.users (full_name, username,	role,	password, created_at, updated_at) VALUES ('+
      QuotedStr(EditName.Text)+','+QuotedStr(EditUsername.Text)+','+QuotedStr(ComboBoxRole.Text)+','+QuotedStr(getmd5(EditPassword.Text))+','+QuotedStr(dateNow)+','+QuotedStr(dateNow)+
    ')';
    Execute;
  end;
  FListUser.BtnRefresh.Click;
  FAddUser.Close;
end;

procedure TFAddUser.BitBtn2Click(Sender: TObject);
begin
  FAddUser.close;
end;

end.
