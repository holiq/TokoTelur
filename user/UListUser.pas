unit UListUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFListUser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnAdd: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    BtnEdit: TBitBtn;
    Splitter3: TSplitter;
    BtnRefresh: TBitBtn;
    Splitter4: TSplitter;
    BtnDelete: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    QUser: TFDQuery;
    DataSource1: TDataSource;
    QUserid: TLargeintField;
    QUserfull_name: TStringField;
    QUserusername: TStringField;
    QUserrole: TStringField;
    QUserpassword: TStringField;
    QUsercreated_at: TSQLTimeStampField;
    QUserupdated_at: TSQLTimeStampField;
    procedure BtnEditClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListUser: TFListUser;

implementation

{$R *.dfm}

uses Uadduser, Uedituser, UDataModule;

procedure TFListUser.BitBtn5Click(Sender: TObject);
begin
  FListUser.Close;
end;

procedure TFListUser.BtnAddClick(Sender: TObject);
begin
  Application.CreateForm(TFAddUser, FAddUser);
  FAddUser.ShowModal;
  FAddUser.Free;
end;

procedure TFListUser.BtnDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah yakin menghapus user tersebut?',
  'konfirmasi', MB_YESNO or MB_ICONINFORMATION) = idyes then
  begin
    with DataModule.QTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= 'DELETE FROM toko_telur.users '+
        'WHERE users.id='+QuotedStr(IntToStr(QUserid.AsInteger));
      Execute;
    end;
    BtnRefresh.Click;
  end;
end;

procedure TFListUser.BtnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFEditUser, FEditUser);
  FEditUser.EditName.Text:= QUserfull_name.AsString;
  FEditUser.EditUsername.Text:= QUserusername.AsString;
  FEditUser.ComboBoxRole.Text:= QUserrole.AsString;
  FEditUser.LID.Caption:= QUserid.AsString;
  FEditUser.ShowModal;
  FEditUser.Free;
end;

procedure TFListUser.BtnRefreshClick(Sender: TObject);
begin
  if QUser.Active then
    QUser.Refresh
  else
    QUser.Open;
end;

end.
