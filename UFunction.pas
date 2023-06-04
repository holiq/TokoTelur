unit UFunction;

interface
  uses SysUtils,Variants,Forms,Windows,Controls, StdCtrls, ComCtrls,
    Messages,Classes,Dialogs,Graphics, IdHashMessageDigest, idHash,
    DateUtils, UDataModule;

function getmd5(SourceString: string): string;
function dateNow(): string;
procedure update(TableName: string; DataColumn: TArray<string>);

var
  username, password, role, id_user, fullName: string;
  quantity, price_kg, total_price :integer;
  currentDate: TDateTime;
  formatDate, query: string;

implementation

(* function read html5*)
function getmd5(SourceString: string): string;
  var
    md5: TIdHashMessageDigest5;
begin
  result := '';
  md5 := TIdHashMessageDigest5.Create;
  try
    result := AnsiLowerCase(md5.HashStringAsHex(SourceString));
  finally
    FreeAndNil(md5);
  end;
end;

procedure update(TableName: string; DataColumn: TArray<string>);
begin
//  with DataModule.QTemp do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text:= 'UPDATE toko_telur.products SET '+
//      'name='+QuotedStr(EditName.Text)+', '+
//      'stock_kg='+QuotedStr(EditStock.Text)+', '+
//      'price_kg='+QuotedStr(EditPrice.Text)+', '+
//      'updated_at='+QuotedStr(dateNow)+' '+
//      'WHERE products.id='+QuotedStr(LID.Caption);
//    Execute;
//  end;
end;

function dateNow(): string;
begin
  currentDate := Now;
  formatDate:= FormatDateTime('yyyy-mm-dd hh:nn:ss', currentDate);
  result:= formatDate;
end;

end.

