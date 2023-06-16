unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.UITypes;

type
  TFLogin = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  username, password: string;

implementation

{$R *.dfm}

uses Umainmenu, UFunction, UDataModule;

procedure TFLogin.BitBtn1Click(Sender: TObject);
begin
  username:= Trim(Edit1.Text);
  password:= getmd5(Edit2.Text);

  with DataModule.QTemp do
  begin
    SQL.Clear;
    SQL.Add('select * from users where username='+QuotedStr(username));
    SQL.Add('and password='+QuotedStr(password));
    Open;
  end;

  if DataModule.QTemp.RecordCount > 0 then
  begin
    role:= DataModule.QTemp.FieldByName('role').AsString;
    fullName:= DataModule.QTemp.FieldByName('full_name').AsString;
    id_user:= DataModule.QTemp.FieldByName('id').AsString;
    if role<>'owner' then
    begin
      with FMainMenu do
      begin
        MainMenu1.Items.Delete(1);
        MainMenu1.Items.Delete(3);


        //ShowMessage(MainMenu1.Item);
      end;
    end;
    FLogin.Close;
  end
  else
  begin
    MessageDlg('User/Password Salah', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Edit1.Clear;
    Edit2.Clear;
    Edit1.SetFocus;
  end;
end;

procedure TFLogin.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFLogin.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then  edit2.SetFocus;

end;

procedure TFLogin.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then  bitbtn1.Click;
end;

end.
