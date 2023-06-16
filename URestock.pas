unit URestock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRestock = class(TForm)
    EditQty: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EditPrice: TEdit;
    Label3: TLabel;
    EditTotal: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label5: TLabel;
    QProduct: TFDQuery;
    QProductname: TStringField;
    Label6: TLabel;
    QProductid: TLargeintField;
    QProductprice_kg: TIntegerField;
    QProductstock_kg: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditPriceChange(Sender: TObject);
    procedure EditTotalChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRestock: TFRestock;
  id_product, name_product: string;
  dashPos, stock_product: Integer;
  qty, price, total: Double;

implementation

{$R *.dfm}

uses UDataModule, UFunction;

procedure TFRestock.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.Text='' then
    ValidateMsg:= 'produk'
  else if EditQty.Text='' then
    ValidateMsg:= 'jumlah'
  else if EditPrice.Text='' then
    ValidateMsg:= 'harga'
  else if EditTotal.Text='' then
    ValidateMsg:= 'total harga'
  else
    ValidateMsg:= '';

  if ValidateMsg<>'' then
  begin
    Validation(ValidateMsg);
    Exit;
  end;

  with DataModule.QTemp do
  begin;
    Close;
    SQL.Clear;
    SQL.Text:= 'INSERT INTO toko_telur.transactions (user_id, product_id,	quantity,	price_kg, total_price, type, created_at, updated_at) VALUES ('+
      QuotedStr(id_user)+','+QuotedStr(id_product)+','+QuotedStr(EditQty.Text)+','+QuotedStr(EditPrice.Text)+','+QuotedStr(EditTotal.Text)+','+QuotedStr('restock')+','+QuotedStr(dateNow)+','+QuotedStr(dateNow)+
    ')';
    Execute;
    SQL.Clear;
    SQL.Text:= 'UPDATE toko_telur.products SET '+
      'stock_kg='+QuotedStr(IntToStr(stock_product+StrToInt(EditQty.Text)))+' '+
      'WHERE products.id='+QuotedStr(id_product);
    Execute;
  end;
  FRestock.Close;
end;

procedure TFRestock.BitBtn2Click(Sender: TObject);
begin
  FRestock.close;
end;

procedure TFRestock.ComboBox1Change(Sender: TObject);
begin
  QProduct.SQL.Clear;
  QProduct.SQL.Text:= 'SELECT id, name, price_kg, stock_kg FROM products WHERE name='+QuotedStr(ComboBox1.Text);
  QProduct.Open;
  while not QProduct.Eof do
  begin;
    stock_product:= QProductstock_kg.AsInteger;
    id_product:= QProductid.AsString;
    Label6.Caption:= '(Tersedia: '+IntToStr(stock_product)+'kg)';
    QProduct.Next;
  end;
  QProduct.Close;
end;

procedure TFRestock.EditPriceChange(Sender: TObject);
begin
  qty:= StrToInt(EditQty.Text);
  price:= StrToFloat(EditPrice.Text);
  EditTotal.Text:= FloatToStr(qty*price);
end;

procedure TFRestock.EditTotalChange(Sender: TObject);
begin
  qty:= StrToInt(EditQty.Text);
  total:= StrToInt(EditTotal.Text);
  EditPrice.Text:= FloatToStr(total/qty);
end;

procedure TFRestock.FormCreate(Sender: TObject);
begin
  QProduct.Open;
  try
    while not QProduct.Eof do
    begin
      ComboBox1.Items.Add(QProduct.FieldByName('name').AsString);
      QProduct.Next;
    end;
  finally
    QProduct.Close;
  end;
end;

end.
