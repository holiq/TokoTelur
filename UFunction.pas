unit UFunction;

interface
  uses SysUtils,Variants,Forms,Windows,Controls, StdCtrls, ComCtrls,
    Messages,Classes,Dialogs,Graphics, IdHashMessageDigest, idHash,
    DateUtils, UDataModule;

function getmd5(SourceString: string): string;
function dateNow(): string;
function SnakeCase(const InputString: string): string;
procedure Validation(Msg: string);

var
  username, password, role, id_user, fullName, ValidateMsg: string;
  quantity, price_kg, total_price :integer;
  currentDate: TDateTime;
  formatDate, query: string;

implementation

procedure Validation(Msg: string);
begin
  Messagedlg(Msg+' tidak boleh kosong', mtWarning, [Mbok], 0);
end;

function SnakeCase(const InputString: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(InputString) do
  begin
    if InputString[i] = ' ' then
      Result := Result + '_'
    else
      Result := Result + LowerCase(InputString[i]);
  end;
end;

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

function dateNow(): string;
begin
  currentDate := Now;
  formatDate:= FormatDateTime('yyyy-mm-dd hh:nn:ss', currentDate);
  result:= formatDate;
end;

end.

