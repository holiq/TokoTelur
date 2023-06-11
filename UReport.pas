unit UReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.CheckLst;

type
  TFReport = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    BitBtn2: TBitBtn;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    BitBtn3: TBitBtn;
    Splitter4: TSplitter;
    SplitView1: TSplitView;
    Label1: TLabel;
    Memo1: TMemo;
    SplitView2: TSplitView;
    Label2: TLabel;
    Memo2: TMemo;
    Splitter5: TSplitter;
    BitBtn4: TBitBtn;
    Splitter6: TSplitter;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Splitter7: TSplitter;
    QTransaction: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure getReportDaily(TypeTransaction: string; Memo: TMemo);
    procedure getReportWeekly(TypeTransaction: string; Memo: TMemo);
    procedure getReportMonthly(TypeTransaction: string; Memo: TMemo);
    procedure getReportYearly(TypeTransaction: string; Memo: TMemo);
    procedure getReportAll(TypeTransaction: string; Memo: TMemo);
  public
    { Public declarations }
  end;

var
  FReport: TFReport;
  WhereProduct: string;

implementation

{$R *.dfm}

uses UDataModule, UFunction;

procedure TFReport.getReportDaily(TypeTransaction: string; Memo: TMemo);
begin
  with QTransaction do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() THEN quantity ELSE 0 END) qty_today, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() THEN total_price ELSE 0 END) price_today, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -1 THEN quantity ELSE 0 END) qty_yesterday, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -1 THEN total_price ELSE 0 END) price_yesterday, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -2 THEN quantity ELSE 0 END) qty_two_days_ago, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -2 THEN total_price ELSE 0 END) price_two_days_ago,'+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -3 THEN quantity ELSE 0 END) qty_three_days_ago, '+
      'SUM(CASE WHEN DATE(created_at) = CURDATE() -3 THEN total_price ELSE 0 END) price_three_days_ago '+
      'FROM transactions WHERE TYPE='+QuotedStr(TypeTransaction);
    Open;
    while not Eof do
    begin
      Memo.Clear;
      Memo.Lines.Add('Hari ini');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_today').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_today').AsCurrency]));
      Memo.Lines.Add('Kemarin');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_yesterday').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_yesterday').AsCurrency]));
      Memo.Lines.Add('2 Hari yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_two_days_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_two_days_ago').AsCurrency]));
      Memo.Lines.Add('3 Hari yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_three_days_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_three_days_ago').AsCurrency]));
      Next;
    end;
    Close;
  end;
end;

procedure TFReport.getReportWeekly(TypeTransaction: string; Memo: TMemo);
begin
  with QTransaction do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) THEN quantity ELSE 0 END) qty_this_week, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) THEN total_price ELSE 0 END) price_this_week, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -1 THEN quantity ELSE 0 END) qty_last_weeks, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -1 THEN total_price ELSE 0 END) price_last_weeks, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -2 THEN quantity ELSE 0 END) qty_two_weeks_ago, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -2 THEN total_price ELSE 0 END) price_two_weeks_ago,'+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -3 THEN quantity ELSE 0 END) qty_three_weeks_ago, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -3 THEN total_price ELSE 0 END) price_three_weeks_ago,'+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -4 THEN quantity ELSE 0 END) qty_four_weeks_ago, '+
      'SUM(CASE WHEN YEARWEEK(created_at) = YEARWEEK(CURDATE()) -4 THEN total_price ELSE 0 END) price_four_weeks_ago '+
      'FROM transactions WHERE TYPE='+QuotedStr(TypeTransaction);
    Open;
    while not Eof do
    begin
      Memo.Clear;
      Memo.Lines.Add('Minggu ini');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_this_week').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_this_week').AsCurrency]));
      Memo.Lines.Add('Minggu Kemarin');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_last_weeks').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_last_weeks').AsCurrency]));
      Memo.Lines.Add('2 Minggu yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_two_weeks_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_two_weeks_ago').AsCurrency]));
      Memo.Lines.Add('3 Minggu yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_three_weeks_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_three_weeks_ago').AsCurrency]));
      Memo.Lines.Add('4 Minggu yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_four_weeks_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_four_weeks_ago').AsCurrency]));
      Next;
    end;
    Close;
  end;
end;

procedure TFReport.getReportMonthly(TypeTransaction: string; Memo: TMemo);
begin
  with QTransaction do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) THEN quantity ELSE 0 END) qty_this_month, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) THEN total_price ELSE 0 END) price_this_month, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -1 THEN quantity ELSE 0 END) qty_last_months, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -1 THEN total_price ELSE 0 END) price_last_months, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -2 THEN quantity ELSE 0 END) qty_two_months_ago, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -2 THEN total_price ELSE 0 END) price_two_months_ago,'+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -3 THEN quantity ELSE 0 END) qty_three_months_ago, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -3 THEN total_price ELSE 0 END) price_three_months_ago,'+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -4 THEN quantity ELSE 0 END) qty_four_months_ago, '+
      'SUM(CASE WHEN MONTH(created_at) = MONTH(CURDATE()) -4 THEN total_price ELSE 0 END) price_four_months_ago '+
      'FROM transactions WHERE TYPE='+QuotedStr(TypeTransaction);
    Open;
    while not Eof do
    begin
      Memo.Clear;
      Memo.Lines.Add('Bulan ini');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_this_month').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_this_month').AsCurrency]));
      Memo.Lines.Add('Bulan lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_last_months').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_last_months').AsCurrency]));
      Memo.Lines.Add('2 Bulan yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_two_months_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_two_months_ago').AsCurrency]));
      Memo.Lines.Add('3 Bulan yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_three_months_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_three_months_ago').AsCurrency]));
      Memo.Lines.Add('4 Bulan yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_four_months_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_four_months_ago').AsCurrency]));
      Next;
    end;
    Close;
  end;
end;

procedure TFReport.getReportYearly(TypeTransaction: string; Memo: TMemo);
begin
  with QTransaction do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) THEN quantity ELSE 0 END) qty_this_year, '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) THEN total_price ELSE 0 END) price_this_year, '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) -1 THEN quantity ELSE 0 END) qty_last_years, '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) -1 THEN total_price ELSE 0 END) price_last_years, '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) -2 THEN quantity ELSE 0 END) qty_two_years_ago, '+
      'SUM(CASE WHEN YEAR(created_at) = YEAR(CURDATE()) -2 THEN total_price ELSE 0 END) price_two_years_ago '+
      'FROM transactions WHERE TYPE='+QuotedStr(TypeTransaction);
    Open;
    while not Eof do
    begin
      Memo.Clear;
      Memo.Lines.Add('Tahun ini');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_this_year').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_this_year').AsCurrency]));
      Memo.Lines.Add('Tahun lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_last_years').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_last_years').AsCurrency]));
      Memo.Lines.Add('2 Tahun yang lalu');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_two_years_ago').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_two_years_ago').AsCurrency]));
      Next;
    end;
    Close;
  end;
end;

procedure TFReport.getReportAll(TypeTransaction: string; Memo: TMemo);
begin
  with QTransaction do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT '+
      'SUM(quantity) AS qty_total,SUM(total_price) AS price_total '+
      'FROM transactions WHERE TYPE='+QuotedStr(TypeTransaction);
    Open;
    while not Eof do
    begin
      Memo.Clear;
      Memo.Lines.Add('Total Keseluruhan');
      Memo.Lines.Add('Total Terjual: '+FieldByName('qty_total').AsString+'kg');
      Memo.Lines.Add('Total Pendapatan: '+Format('Rp. %n', [FieldByName('price_total').AsCurrency]));
      Next;
    end;
    Close;
  end;
end;

procedure TFReport.BitBtn1Click(Sender: TObject);
begin
  getReportDaily('penjualan', Memo1);
  getReportDaily('restock', Memo2);
end;

procedure TFReport.BitBtn2Click(Sender: TObject);
begin
  getReportWeekly('penjualan', Memo1);
  getReportWeekly('restock', Memo2);
end;

procedure TFReport.BitBtn3Click(Sender: TObject);
begin
  getReportMonthly('penjualan', Memo1);
  getReportMonthly('restock', Memo2);
end;

procedure TFReport.BitBtn4Click(Sender: TObject);
begin
  getReportYearly('penjualan', Memo1);
  getReportYearly('restock', Memo2);
end;

procedure TFReport.BitBtn5Click(Sender: TObject);
begin
  getReportAll('penjualan', Memo1);
  getReportAll('restock', Memo2);
end;

procedure TFReport.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Add('Semua');
  with DataModule.QTemp do
  begin
    SQL.Clear;
    SQL.Text:= 'SELECT name FROM products';
    Open;
    while not Eof do
    begin
      ComboBox1.Items.Add(FieldByName('name').AsString);
      Next;
    end;
    Close;
  end;
  BitBtn5.Click;
end;

end.
