unit UEditProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFEditProduct = class(TForm)
    EditName: TEdit;
    EditStock: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditPrice: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    LID: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditProduct: TFEditProduct;

implementation

{$R *.dfm}

uses UDataModule, UListProduct, UFunction;

procedure TFEditProduct.BitBtn1Click(Sender: TObject);
begin
  with DataModule.QTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= 'UPDATE toko_telur.products SET '+
      'name='+QuotedStr(EditName.Text)+', '+
      'stock_kg='+QuotedStr(EditStock.Text)+', '+
      'price_kg='+QuotedStr(EditPrice.Text)+', '+
      'updated_at='+QuotedStr(dateNow)+' '+
      'WHERE products.id='+QuotedStr(LID.Caption);
    Execute;
  end;
  FListProduct.BtnRefresh.Click;
  FEditProduct.Close;
end;

procedure TFEditProduct.BitBtn2Click(Sender: TObject);
begin
  FEditProduct.close;
end;

end.
