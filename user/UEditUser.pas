unit UEditUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFEditUser = class(TForm)
    EditName: TEdit;
    EditUsername: TEdit;
    EditPassword: TEdit;
    ComboBoxRole: TComboBox;
    BtnUpdate: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnClose: TBitBtn;
    Label5: TLabel;
    LID: TLabel;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditUser: TFEditUser;

implementation

{$R *.dfm}

uses UFunction, UDataModule, UListUser;

procedure TFEditUser.BtnUpdateClick(Sender: TObject);
begin
  with DataModule.QTemp do
  begin
    Close;
    SQL.Clear;
    if EditPassword.Text='' then
    begin
      SQL.Text:= 'UPDATE toko_telur.users SET '+
      'full_name='+QuotedStr(EditName.Text)+', '+
      'username='+QuotedStr(EditUsername.Text)+', '+
      'role='+QuotedStr(ComboBoxRole.Text)+', '+
      'updated_at='+QuotedStr(dateNow)+' '+
      'WHERE users.id='+QuotedStr(LID.Caption);
    end
    else
    begin
      SQL.Text:= 'UPDATE toko_telur.users SET '+
      'full_name='+QuotedStr(EditName.Text)+', '+
      'username='+QuotedStr(EditUsername.Text)+', '+
      'role='+QuotedStr(ComboBoxRole.Text)+', '+
      'password='+QuotedStr(getmd5(EditPassword.Text))+', '+
      'updated_at='+QuotedStr(dateNow)+' '+
      'WHERE users.id='+QuotedStr(LID.Caption);
    end;
    Execute;
  end;
  FListUser.BtnRefresh.Click;
  FEditUser.Close;
end;

procedure TFEditUser.BtnCloseClick(Sender: TObject);
begin
  FEditUser.close;
end;

end.
