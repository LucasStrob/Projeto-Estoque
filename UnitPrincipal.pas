unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Cadastros1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Movimentaes1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    ConsultarMovimentaes1: TMenuItem;
    ConsultarMovimentaes2: TMenuItem;
    Sair1: TMenuItem;
    CadastroTampas1: TMenuItem;
    CadastroFrascos1: TMenuItem;
    CadastroCliente1: TMenuItem;
    CadastroPedido1: TMenuItem;
    Panel1: TPanel;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
    procedure ConsultarMovimentaes1Click(Sender: TObject);
    procedure CadastroTampas1Click(Sender: TObject);
    procedure CadastroFrascos1Click(Sender: TObject);
    procedure CadastroCliente1Click(Sender: TObject);
    procedure CadastroPedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadMovimentacao, UnitConsMovimentacao, UnitCadProdutos, UnitTampas,
  UnitFrasco, UnitCliente, UnitPedidos;

procedure TFormPrincipal.CadastroCliente1Click(Sender: TObject);
begin
  with TFormCliente.create(self) do
  begin
    if ShowModal = mrOK then
    begin

    end;
  end;
end;

procedure TFormPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
    with TformCadProdutos.create(self) do
		 begin
			if showmodal = mrOk then
		 	begin

			end;
		 end;
end;

procedure TFormPrincipal.CadastroFrascos1Click(Sender: TObject);
begin
  with TFormFrascos.create(self) do
    if ShowModal = mrOK then
    begin

    end;
end;

procedure TFormPrincipal.CadastroPedido1Click(Sender: TObject);
begin
  with TFormPedido.create(self) do
  begin
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormPrincipal.CadastroTampas1Click(Sender: TObject);
begin
    with TFormTampas.create(self) do
      if showmodal = mrOK then
        begin

        end;
end;

procedure TFormPrincipal.ConsultarMovimentaes1Click(Sender: TObject);
begin
  with TformConsMovimentacao.create(self) do
    if showmodal = mrOK then
      begin

      end;
end;

procedure TFormPrincipal.GerenciarMovimentaes1Click(Sender: TObject);
begin
 with TformCadMovimentacao.create(self) do
  begin
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  application.terminate;
end;

end.
