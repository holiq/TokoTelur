unit UListProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFListProduct = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    BtnAdd: TBitBtn;
    BtnEdit: TBitBtn;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    QProduct: TFDQuery;
    DataSource1: TDataSource;
    BtnRefresh: TBitBtn;
    Splitter3: TSplitter;
    BtnDelete: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    EditSearch: TEdit;
    Label4: TLabel;
    Splitter4: TSplitter;
    QProductid: TLargeintField;
    QProductname: TStringField;
    QProductstock_kg: TIntegerField;
    QProductprice_kg: TIntegerField;
    QProductcreated_at: TSQLTimeStampField;
    QProductupdated_at: TSQLTimeStampField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListProduct: TFListProduct;

implementation

{$R *.dfm}

uses Uaddproduct, Ueditproduct, UDataModule;

procedure TFListProduct.BtnAddClick(Sender: TObject);
begin
  Application.CreateForm(TFAddProduct, FAddProduct);
  FAddProduct.ShowModal;
  Faddproduct.Free;
end;

procedure TFListProduct.BtnDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah yakin menghapus product tersebut?',
  'konfirmasi', MB_YESNO or MB_ICONINFORMATION) = idyes then
  begin
    with DataModule.QTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= 'DELETE FROM toko_telur.products '+
        'WHERE products.id='+QuotedStr(IntToStr(QProductid.AsInteger));
      Execute;
    end;
    BtnRefresh.Click;
  end;
end;

procedure TFListProduct.BtnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFEditProduct, FEditProduct);
  FEditProduct.LID.Caption:= IntToStr(QProductid.AsInteger);
  FEditProduct.EditName.Text:= QProductname.AsString;
  FEditProduct.EditStock.Text:= IntToStr(QProductstock_kg.AsInteger);
  FEditProduct.EditPrice.Text:= IntToStr(QProductprice_kg.AsInteger);
  FEditProduct.ShowModal;
  FEditProduct.Free;
end;

procedure TFListProduct.BtnRefreshClick(Sender: TObject);
begin
  if QProduct.Active then
    QProduct.Refresh
  else
    QProduct.Open;
end;

procedure TFListProduct.EditSearchChange(Sender: TObject);
begin
  QProduct.MacroByName('WHERE').Value:= ' WHERE name LIKE '+
    QuotedStr('%'+EditSearch.Text+'%');
  QProduct.Open;
  while not QProduct.Eof do
  begin
    QProduct.Refresh;
    QProduct.Next;
  end;
end;

procedure TFListProduct.BitBtn1Click(Sender: TObject);
begin
  FListProduct.close;
end;

end.
