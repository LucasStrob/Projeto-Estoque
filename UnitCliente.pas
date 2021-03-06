unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.ToolWin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormCliente = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    DBGrid1: TDBGrid;
    acNovo: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sqlCliente: TFDQuery;
    dsCliente: TDataSource;
    Button1: TButton;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure pegaDados;
  public
    { Public declarations }

  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

uses UnitDM, UnitCadCliente, UnitPedidos, UnitNovoPedido;

//FUN??ES BOT?ES
procedure TFormCliente.acEditarExecute(Sender: TObject);
begin
  with TFormCadCliente.create(self) do
  begin
    id := sqlCliente.FieldByName('id').AsString;
    if ShowModal = mrOK then
    begin

    end;
  end;


end;

procedure TFormCliente.acExcluirExecute(Sender: TObject);
begin

    with dm.qu do
    begin
      Close;
      SQL.Text:='select TOP 1 id from pedido where id_cliente = ' + sqlCliente.FieldByName('id').AsString;
      Open;
      if FieldByName('id').AsString <> '' then
      begin
        showMessage('Cliente possui pedidos.');
        Exit;
      end;
    end;

    with dm.qu do
    begin
      close;
      SQL.Text := 'DELETE from cliente WHERE id = ' + sqlCliente.FieldByName('id').AsString;
      ExecSQL;
    end;

    pegaDados;
end;

procedure TFormCliente.acNovoExecute(Sender: TObject);
begin
  with TFormCadCliente.create(self) do
  begin
    if ShowModal = mrOk then
    begin

    end;
  end;
end;
//------------------------------------------------------------------------------

//CRIA??O DE TELAS E PUXA DADOS
procedure TFormCliente.Button1Click(Sender: TObject);
begin
 pegaDados;
end;

procedure TFormCliente.FormShow(Sender: TObject);
begin
 pegaDados;
end;

procedure TFormCliente.pegadados;
begin
  with sqlCliente do
  begin
    Close;
    sql.Text := 'SELECT * FROM cliente';
    Open;

  end;
end;
//------------------------------------------------------------------------------

end.
