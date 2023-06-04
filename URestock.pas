unit URestock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrestock = class(TForm)
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label5: TLabel;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frestock: TFrestock;

implementation

{$R *.dfm}

procedure TFrestock.BitBtn2Click(Sender: TObject);
begin
Frestock.close;
end;

end.
