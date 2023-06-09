unit UReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFReport = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    BitBtn2: TBitBtn;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    BitBtn3: TBitBtn;
    QPenjualan: TFDQuery;
    QRestock: TFDQuery;
    Splitter4: TSplitter;
    SplitView1: TSplitView;
    Label1: TLabel;
    Memo1: TMemo;
    SplitView2: TSplitView;
    Label2: TLabel;
    Memo2: TMemo;
    Splitter5: TSplitter;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReport: TFReport;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFReport.BitBtn1Click(Sender: TObject);
begin
  Memo1.Clear;

  QPenjualan.SQL.Clear;
  QPenjualan.SQL.Text:= 'SELECT '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() THEN quantity ELSE 0 END) qty_today, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() THEN total_price ELSE 0 END) price_today, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -1 THEN quantity ELSE 0 END) qty_yesterday, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -1 THEN total_price ELSE 0 END) price_yesterday, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -2 THEN quantity ELSE 0 END) qty_two_days_ago, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -2 THEN total_price ELSE 0 END) price_two_days_ago,'+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -3 THEN quantity ELSE 0 END) qty_three_days_ago, '+
    'SUM(CASE WHEN DATE(created_at) = CURDATE() -3 THEN total_price ELSE 0 END) price_three_days_ago '+
    'FROM transactions WHERE TYPE='+QuotedStr('penjualan');
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('Hari ini');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('qty_today').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('price_today').AsCurrency]));
    Memo1.Lines.Add('Kemarin');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('qty_yesterday').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('price_yesterday').AsCurrency]));
    Memo1.Lines.Add('2 Hari yang lalu');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('qty_two_days_ago').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('price_two_days_ago').AsCurrency]));
    Memo1.Lines.Add('3 Hari yang lalu');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('qty_three_days_ago').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('price_three_days_ago').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;
end;

procedure TFReport.FormCreate(Sender: TObject);
begin
  QPenjualan.SQL.Clear;
  QPenjualan.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS income FROM transactions WHERE type='+QuotedStr('penjualan');
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('Total Keseluruhan');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('total_sell').AsString+'kg');
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('income').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;

  QRestock.SQL.Clear;
  QRestock.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS expenses FROM transactions WHERE type='+QuotedStr('restock');
  QRestock.Open;
  while not QRestock.Eof do
  begin
    Memo2.Lines.Add('Total Keseluruhan');
    Memo2.Lines.Add('Total Restock: '+QRestock.FieldByName('total_sell').AsString+'kg');
    Memo2.Lines.Add('Total Pengeluaran: '+Format('Rp. %n', [QRestock.FieldByName('expenses').AsCurrency]));
    QRestock.Next;
  end;
  QRestock.Close;
end;

end.
