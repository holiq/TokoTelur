unit UListTransaction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    QTransactionid: TFDAutoIncField;
    QTransactionfull_name: TStringField;
    QTransactionproduct_name: TStringField;
    QTransactionquantity: TIntegerField;
    QTransactionprice_kg: TIntegerField;
    QTransactiontotal_price: TIntegerField;
    QTransactiontype: TStringField;
    QTransactioncreated_at: TDateTimeField;
    QTransactionupdated_at: TDateTimeField;
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListTransaction: TFListTransaction;

implementation

{$R *.dfm}

uses UDataModule, UPenjualan;

procedure TFListTransaction.BtnRefreshClick(Sender: TObject);
begin
  if QTransaction.Active then
    QTransaction.Refresh
  else
    QTransaction.Open;
end;

procedure TFListTransaction.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TFPenjualan, FPenjualan);
  FPenjualan.ShowModal;
  FPenjualan.Free;
end;

procedure TFListTransaction.BitBtn5Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
