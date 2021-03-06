program Estoque;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadMovimentacao in 'UnitCadMovimentacao.pas' {formConsMovimentacao},
  UnitConsMovimentacao in 'UnitConsMovimentacao.pas' {formCadMovimentacao},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitCadProdutos in 'UnitCadProdutos.pas' {formCadProdutos},
  UnitTampas in 'UnitTampas.pas' {FormTampas},
  UnitCadTampas in 'UnitCadTampas.pas' {FormCadTampas},
  UnitCadFrascos in 'UnitCadFrascos.pas' {FormCadFrascos},
  UnitFrasco in 'UnitFrasco.pas' {FormFrascos},
  UnitCliente in 'UnitCliente.pas' {FormCliente},
  UnitCadCliente in 'UnitCadCliente.pas' {FormCadCliente},
  UnitPedidos in 'UnitPedidos.pas' {FormPedido},
  UnitNovoPedido in 'UnitNovoPedido.pas' {FormNovoPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
