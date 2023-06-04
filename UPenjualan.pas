unit UPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFpenjualan = class(TForm)
    EditQty: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EditPrice: TEdit;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label4: TLabel;
    QProduct: TFDQuery;
    Label5: TLabel;
    EditTotal: TEdit;
    QProductid: TFDAutoIncField;
    QProductname: TStringField;
    QProductstock_kg: TIntegerField;
    QProductprice_kg: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure EditQtyChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpenjualan: TFpenjualan;
  id_product, name_product: string;
  dashPos, price_product: Integer;

implementation

{$R *.dfm}

uses UDataModule, UFunction;

procedure TFpenjualan.BitBtn1Click(Sender: TObject);
begin
  with DataModule.QTemp do
  begin;
    Close;
    SQL.Clear;
    SQL.Text:= 'INSERT INTO toko_telur.transactions (user_id, product_id,	quantity,	price_kg, total_price, type, created_at, updated_at) VALUES ('+
      QuotedStr(id_user)+','+QuotedStr(id_product)+','+QuotedStr(EditQty.Text)+','+QuotedStr(EditPrice.Text)+','+QuotedStr(EditTotal.Text)+','+QuotedStr('penjualan')+','+QuotedStr(dateNow)+','+QuotedStr(dateNow)+
    ')';
    Execute;
  end;
  FPenjualan.Close;
end;

procedure TFpenjualan.BitBtn2Click(Sender: TObject);
begin
  FPenjualan.close;
end;

procedure TFpenjualan.ComboBox1Change(Sender: TObject);
begin
  name_product:= ComboBox1.Text;
  dashPos:= Pos('-', name_product);
  if dashPos > 0 then
  begin
    id_product:= Copy(name_product, dashPos + 1, Length(name_product));
  end;

  QProduct.SQL.Clear;
  QProduct.SQL.Text:= 'SELECT * FROM products WHERE id = :idp';
  QProduct.ParamByName('idp').AsString:= id_product;
  QProduct.Open;
  while not QProduct.Eof do
  begin
    EditPrice.Text:= QProductprice_kg.AsString;
    price_product:= QProductprice_kg.AsInteger;
    QProduct.Next;
  end;
  QProduct.Close;
end;

procedure TFpenjualan.EditQtyChange(Sender: TObject);
begin
  EditTotal.Text:= IntToStr(price_product*StrToInt(EditQty.Text))
end;

procedure TFpenjualan.FormCreate(Sender: TObject);
begin
  QProduct.Open;
  try
    while not QProduct.Eof do
    begin
      ComboBox1.Items.Add(
        QProduct.FieldByName('name').AsString+'-'+
        QProduct.FieldByName('id').AsString
      );
      QProduct.Next;
    end;
  finally
    QProduct.Close;
  end;
end;

end.
