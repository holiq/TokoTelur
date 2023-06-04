unit UAddProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFAddProduct = class(TForm)
    EditName: TEdit;
    EditStock: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditPrice: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddProduct: TFAddProduct;

implementation

{$R *.dfm}

uses UDataModule, UListProduct, UFunction;

procedure TFAddProduct.BitBtn1Click(Sender: TObject);
begin
  with DataModule.QTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= 'INSERT INTO toko_telur.products (name, stock_kg,	price_kg,	created_at, updated_at) VALUES ('+
      QuotedStr(EditName.Text)+','+QuotedStr(EditStock.Text)+','+QuotedStr(EditPrice.Text)+','+QuotedStr(dateNow)+','+QuotedStr(dateNow)+
    ')';
    Execute;
  end;
  FListProduct.BtnRefresh.Click;
  FAddProduct.Close;
end;

procedure TFAddProduct.BitBtn2Click(Sender: TObject);
begin
FAddProduct.close;
end;

end.
