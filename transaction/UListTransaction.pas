unit UListTransaction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Math;

type
  TFListTransaction = class(TForm)
    Panel1: TPanel;
    BtnRefresh: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    Splitter4: TSplitter;
    QTransaction: TFDQuery;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Splitter3: TSplitter;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label4: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    QProduct: TFDQuery;
    QTransactionid: TLargeintField;
    QTransactionfull_name: TStringField;
    QTransactionproduct_name: TStringField;
    QTransactionquantity: TIntegerField;
    QTransactionprice_kg: TIntegerField;
    QTransactiontotal_price: TIntegerField;
    QTransactiontype: TStringField;
    QTransactioncreated_at: TSQLTimeStampField;
    QTransactionupdated_at: TSQLTimeStampField;
    QProductid: TLargeintField;
    QProductname: TStringField;
    QProductstock_kg: TIntegerField;
    Panel4: TPanel;
    BtnNext: TBitBtn;
    BtnPrevious: TBitBtn;
    Splitter5: TSplitter;
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPreviousClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pagination(PageNumber: Integer);
  public
    { Public declarations }
  end;

var
  FListTransaction: TFListTransaction;
  transaction_type: string;
  stock_product, current_stcok,
    TotalPages, RowCount, RecordsPerPage, PageNumber: Integer;

implementation

{$R *.dfm}

uses UDataModule, UPenjualan, URestock;

procedure TFListTransaction.Pagination(PageNumber: Integer);
begin
  RecordsPerPage:= 10;

  QTransaction.MacroByName('WHERE').Value:= ' LIMIT '+
    IntToStr(RecordsPerPage)+' OFFSET '+
    IntToStr((PageNumber - 1) * RecordsPerPage);
  QTransaction.Open;
  while not QTransaction.Eof do
  begin
    QTransaction.Refresh;
    QTransaction.Next;
  end;
end;

procedure TFListTransaction.BtnNextClick(Sender: TObject);
begin
  if PageNumber < TotalPages then
    PageNumber:= PageNumber+1;

  Pagination(PageNumber);
end;

procedure TFListTransaction.BtnPreviousClick(Sender: TObject);
begin
  if not PageNumber = 1 then
    PageNumber:= PageNumber-1
  else
    PageNumber:= 1;

  Pagination(PageNumber);
end;

procedure TFListTransaction.FormCreate(Sender: TObject);
begin
  PageNumber := 1;

  Pagination(PageNumber);

  with DataModule.QTemp do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT COUNT(id) AS total FROM transactions';
    Open;
    First;

    RowCount := 0;
    while not Eof do
    begin
      Inc(RowCount);
      Next;
    end;
    TotalPages:= Ceil(FieldByName('total').AsInteger/10);
  end;
end;

procedure TFListTransaction.BtnRefreshClick(Sender: TObject);
begin
  if QTransaction.Active then
    QTransaction.Refresh
  else
    QTransaction.Open;
end;

procedure TFListTransaction.Edit1Change(Sender: TObject);
begin
  QTransaction.MacroByName('WHERE').Value:= ' WHERE users.full_name LIKE '+
    QuotedStr('%'+Edit1.Text+'%')+' OR products.name LIKE '+QuotedStr('%'+Edit1.Text+'%');
  QTransaction.Open;
  while not QTransaction.Eof do
  begin
    QTransaction.Refresh;
    QTransaction.Next;
  end;
end;

procedure TFListTransaction.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFRestock, FRestock);
  FRestock.ShowModal;
  FRestock.Free;
end;

procedure TFListTransaction.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TFPenjualan, FPenjualan);
  FPenjualan.ShowModal;
  FPenjualan.Free;
end;

procedure TFListTransaction.BitBtn4Click(Sender: TObject);
begin
  if Application.MessageBox('Apakah yakin menghapus transaction tersebut?',
  'konfirmasi', MB_YESNO or MB_ICONINFORMATION) = idyes then
  begin
    QProduct.SQL.Clear;
    QProduct.SQL.Text:= 'SELECT id, name, stock_kg FROM products WHERE id = :idp';
    QProduct.ParamByName('idp').AsString:= id_product;
    QProduct.Open;
    while not QProduct.Eof do
    begin;
      stock_product:= QProductstock_kg.AsInteger;
      QProduct.Next;
    end;
    QProduct.Close;

    if QTransactiontype.AsString='penjualan' then
    begin
      current_stcok:= stock_product+QTransactionquantity.AsInteger;
    end
    else
    begin
      current_stcok:= stock_product-QTransactionquantity.AsInteger
    end;

    with DataModule.QTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= 'DELETE FROM toko_telur.transactions '+
        'WHERE transactions.id='+QuotedStr(IntToStr(QTransactionid.AsInteger));
      Execute;

      SQL.Text:= 'UPDATE toko_telur.products SET '+
        'stock_kg='+QuotedStr(IntToStr(current_stcok))+' '+
        'WHERE products.name='+QuotedStr(QTransactionproduct_name.AsString);
      Execute;
    end;
    BtnRefresh.Click;
  end;
end;

procedure TFListTransaction.BitBtn5Click(Sender: TObject);
begin
  FListTransaction.Close;
end;

end.
