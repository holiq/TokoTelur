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
  QPenjualan.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS income FROM transactions WHERE DATE(created_at)=CURDATE()';
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('Hari ini');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('total_sell').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('income').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;

  QPenjualan.SQL.Clear;
  QPenjualan.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS income FROM transactions WHERE DATE(created_at)=CURDATE()-1';
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('Kemarin');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('total_sell').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('income').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;

  QPenjualan.SQL.Clear;
  QPenjualan.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS income FROM transactions WHERE DATE(created_at)=CURDATE()-2';
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('2 Hari yang lalu');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('total_sell').AsString);
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('income').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;
end;

procedure TFReport.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  QPenjualan.SQL.Clear;
  QPenjualan.SQL.Text:= 'SELECT SUM(quantity) AS total_sell, SUM(total_price) AS income FROM transactions';
  QPenjualan.Open;
  while not QPenjualan.Eof do
  begin
    Memo1.Lines.Add('Total Keseluruhan');
    Memo1.Lines.Add('Total Terjual: '+QPenjualan.FieldByName('total_sell').AsString+'kg');
    Memo1.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [QPenjualan.FieldByName('income').AsCurrency]));
    QPenjualan.Next;
  end;
  QPenjualan.Close;
end;

end.
