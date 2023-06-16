unit UMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    PRODUCT1: TMenuItem;
    TRANSACTION1: TMenuItem;
    PENJUALAN1: TMenuItem;
    RESTOCK1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    REPORT1: TMenuItem;
    Image1: TImage;
    USER1: TMenuItem;
    procedure PENJUALAN1Click(Sender: TObject);
    procedure USER1Click(Sender: TObject);
    procedure PRODUCT1Click(Sender: TObject);
    procedure TRANSACTION1Click(Sender: TObject);
    procedure RESTOCK1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure REPORT1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainMenu: TFMainMenu;

implementation

{$R *.dfm}

uses Ulistuser, Upenjualan, Urestock, Ulistproduct, ULogin, UListTransaction, UReport;

procedure TFMainMenu.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMainMenu.FormCreate(Sender: TObject);
begin
  Image1.Align:= alClient;
  Image1.AutoSize:= true;
  Image1.Center:= true;
end;

procedure TFMainMenu.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFlogin, FLogin);
  FLogin.Show;
end;

procedure TFMainMenu.PENJUALAN1Click(Sender: TObject);
begin
  Application.CreateForm(TFPenjualan, FPenjualan);
  FPenjualan.Show;
end;

procedure TFMainMenu.REPORT1Click(Sender: TObject);
begin
  Application.CreateForm(TFReport, FReport);
  FReport.Show;
end;

procedure TFMainMenu.RESTOCK1Click(Sender: TObject);
begin
  Application.CreateForm(TFRestock, FRestock);
  FRestock.Show;
end;

procedure TFMainMenu.PRODUCT1Click(Sender: TObject);
begin
  Application.CreateForm(TFlistproduct, FListProduct);
  FListProduct.Show;
end;

procedure TFMainMenu.TRANSACTION1Click(Sender: TObject);
begin
  Application.CreateForm(TFListTransaction, FListTransaction);
  FListTransaction.Show;
end;

procedure TFMainMenu.USER1Click(Sender: TObject);
begin
  Application.CreateForm(TFListUser, FListUser);
  FListUser.Show;
end;

end.
