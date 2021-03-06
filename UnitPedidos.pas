unit UnitPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Tabs, Vcl.DockTabSet;

type
  TFormPedido = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    sqlPedidos: TFDQuery;
    dsPedidos: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure pegaDados;
  public
    { Public declarations }
  end;

var
  FormPedido: TFormPedido;

implementation

{$R *.dfm}

uses UnitDM, UnitNovoPedido;

procedure TFormPedido.acEditarExecute(Sender: TObject);
begin
  with TFormNovoPedido.create(self) do
  begin
   with sqlPedidos do
   begin
    Close;
    SQL.Text := 'SELECT * FROM pedido';
    Open;
   end;
    id := sqlPedidos.FieldByName('id').AsString;
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormPedido.acExcluirExecute(Sender: TObject);
begin

  if sqlPedidos.FieldByName('status').AsString <> 'Pendente' then
  begin
    ShowMessage('Este pedido n?o pode ser excluido!');
    exit;
  end;

  with dm.qu do
  begin
    close;
    SQL.Text := 'DELETE FROM pedido WHERE id = ' + sqlPedidos.FieldByName('id').AsString;
    ExecSQL;
  end;
  pegaDados;
end;

procedure TFormPedido.acNovoExecute(Sender: TObject);
begin
  with TFormNovoPedido.create(self) do
  begin
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormPedido.Button1Click(Sender: TObject);
begin
  pegaDados;
end;


procedure TFormPedido.FormShow(Sender: TObject);
begin
  pegaDados;
end;

procedure TFormPedido.pegaDados;
begin
  with sqlPedidos do
  begin
    close;
    sql.Text := 'SELECT '+
                '  id,   '+
                '    CASE   '+
                '      WHEN tipo = ''Tampa'' THEN   '+
                '        (select descricao from tampas where id = id_produto) '+
                '      WHEN tipo = ''Frasco'' THEN  '+
                '        (select descricao from frascos where id = id_produto) '+
                '      ELSE    '+
                '          ''NADA ENCONTRADO''   '+
                '    END as Produto,   '+
                '  tipo, quantidade, valor_unitario, valor_total, status '+
                ' FROM `pedido`';
    open;
  end;
end;



end.
