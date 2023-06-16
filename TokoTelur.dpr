program TokoTelur;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {FLogin},
  UMainMenu in 'UMainMenu.pas' {FMainMenu},
  UListUser in 'user\UListUser.pas' {FListUser},
  UAddUser in 'user\UAddUser.pas' {FAddUser},
  UEditUser in 'user\UEditUser.pas' {FEditUser},
  UListProduct in 'product\UListProduct.pas' {FListProduct},
  UAddProduct in 'product\UAddProduct.pas' {FAddProduct},
  UEditProduct in 'product\UEditProduct.pas' {FEditProduct},
  UListTransaction in 'transaction\UListTransaction.pas' {FListTransaction},
  UPenjualan in 'UPenjualan.pas' {Fpenjualan},
  URestock in 'URestock.pas' {FRestock},
  UDataModule in 'UDataModule.pas' {DataModule},
  UFunction in 'UFunction.pas',
  UReport in 'UReport.pas' {FReport},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TDataModule, DataModule);
  Application.Run;
end.
