unit UnitNovoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFormNovoPedido = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbTipo: TComboBox;
    cbCliente: TComboBox;
    Label8: TLabel;
    cbProduto: TComboBox;
    DBGrid1: TDBGrid;
    edValorUnitario: TMaskEdit;
    edQuantidade: TMaskEdit;
    edValorTotal: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edValorUnitarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure pegaClientes;
    procedure pegaProduto;
    procedure pegaTotal;
    procedure voltaDados;
  public
    { Public declarations }
   id : string;
  end;

  TusrItens = class
    id:string;
  end;


var
  FormNovoPedido: TFormNovoPedido;

implementation

{$R *.dfm}

uses UnitCadCliente, UnitCliente, UnitDM, UnitPedidos;
//VERIFICAR E SALVAR
procedure TFormNovoPedido.Button1Click(Sender: TObject);
begin
   if cbTipo.ItemIndex < 0 then
   begin
     ShowMessage ('O Campo "Tipo" n?o pode ficar vazio');
     Exit;
   end
   else if cbCliente.Text = '' then
   begin
      ShowMessage ('O Campo "Cliente" n?o pode fica vazio');
      exit
   end
   else if cbProduto.Text = '' then
   begin
    ShowMessage ('O Campo "Produto" n?o pode ficar vazio');
    exit;
   end
   else if edValorUnitario.Text = '' then
   begin
    ShowMessage('Digite o Valor Unit?rio do Produto');
    exit;
   end
   else if edQuantidade.Text = '' then
   begin
     ShowMessage('Digite a Quantidade do Produto');
     exit;
   end;

  with dm.qu do
  begin
    close;
    if id <> '' then
    begin
      SQL.Text := 'UPDATE pedido SET tipo = ' +QuotedStr(cbTipo.Text)+
                                  ', quantidade = ' +edQuantidade.Text+
                                  ', valor_unitario = ' +QuotedStr(edValorUnitario.Text)+
                                  ', valor_total =  ' +QuotedStr(edValorTotal.Text) +
                                  ' where id = ' + id;

    end
    else
    begin
      SQL.Text := 'INSERT INTO pedido(id_cliente, id_produto, tipo, quantidade, valor_unitario, valor_total, status)'+
                  'VALUES ('+ TusrItens(cbCliente.Items.Objects[cbCliente.ItemIndex]).id + ',' +
                  TusrItens(cbProduto.Items.Objects[cbProduto.ItemIndex]).id + ',' +
                  QuotedStr(cbTipo.Text)+',' +edQuantidade.Text+','+
                  StringReplace(edValorUnitario.Text, ',', '.',[rfReplaceAll, rfIgnoreCase]) + ',' +
                  StringReplace(edValorTotal.Text, ',', '.',[rfReplaceAll, rfIgnoreCase]) + ',' +
                  ' ''PENDENTE'' )';

    end;
    ShowMessage('Pedido Cadastrado com sucesso');
    ExecSQL;
  end;
  close;
end;
//----------------------------------------------------------------------


procedure TFormNovoPedido.cbTipoChange(Sender: TObject);
begin
   pegaProduto;
   if cbTipo.ItemIndex > -1 then
    cbProduto.Enabled:=true;
end;

procedure TFormNovoPedido.edQuantidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 pegaTotal;
end;

procedure TFormNovoPedido.edValorUnitarioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pegaTotal;
end;


procedure TFormNovoPedido.FormShow(Sender: TObject);
begin
   pegaClientes;
   voltaDados;

end;


//PUXA O NOME E O ID DO CLIENTE NA COMBOBOX
procedure TFormNovoPedido.pegaClientes;
var
  iditem:TusrItens;
begin
  cbCliente.Clear;

  with dm.qu do
  begin
    close;
    sql.Text := 'SELECT id, nome FROM cliente';
    open;
    while not eof do
    begin
      iditem:=TusrItens.Create;
      iditem.id:=FieldByName('id').AsString;
      cbCliente.AddItem(FieldByName('nome').AsString, iditem);
      next;
    end;
  end;
end;
//-----------------------------------------------------------------------


//PUXA INFORMA??O DA COMBOBOX TIPO E PRODUTO
procedure TFormNovoPedido.pegaProduto;
var
  pegaProduto, tabela:String;
  iditem:TusrItens;
begin
  cbProduto.Clear;

  if cbTipo.text = 'Frasco' then
    tabela:='frascos'
  else
    tabela:='tampas';

  with dm.qu do
  begin
    close;
    sql.Text := 'SELECT id, descricao FROM ' + tabela;
    open;
    while not eof do
    begin
      iditem:=TusrItens.Create;
      iditem.id:=FieldByName('id').AsString;
      cbProduto.AddItem(FieldByName('descricao').AsString, iditem);
      next;
    end;
  end;
end;
//-----------------------------------------------------------------------


//CALCULA O VALOR TOTAL DO PEDIDO
procedure TFormNovoPedido.pegaTotal;
  var ValorTotal, num1,num2 : real;
begin
  edValorTotal.Clear;
  if (edValorUnitario.Text <> '') and (edQuantidade.Text <> '') then
  begin
    num1 := StrToFloat(edValorUnitario.Text);
    num2 := StrToFloat(edQuantidade.Text);
    ValorTotal := num1 * num2;
    edValorTotal.Text := FloatToStr(ValorTotal);
  end;
end;
//-------------------------------------------------------------------------

//SALVA AS INFORMA??ES PARA O BOT?O EDITAR
procedure TFormNovoPedido.voltaDados;
var
iditem: integer;

begin
  if id <> '' then
  begin
    with dm.qu do
    begin
      close;
      sql.Text := 'SELECT '+
                  ' (select nome from cliente where id = id_cliente) cliente, '+
                  '    CASE   '+
                  '      WHEN tipo = ''Tampa'' THEN   '+
                  '        (select descricao from tampas where id = id_produto) '+
                  '      WHEN tipo = ''Frasco'' THEN  '+
                  '        (select descricao from frascos where id = id_produto) '+
                  '      ELSE    '+
                  '          ''NADA ENCONTRADO''   '+
                  '    END, '+
                  ' valor_unitario, quantidade, valor_total, id_cliente, tipo '+
                  ' FROM pedido WHERE id = '+ id;
      open;
      edValorUnitario.Text := FieldByName('valor_unitario').AsString;
      edQuantidade.Text := FieldByName('quantidade').AsString;
      edValorTotal.Text := FieldByName('valor_total').AsString;
      cbCliente.ItemIndex:=cbCliente.Items.IndexOf(FieldByName('cliente').AsString);
      cbTipo.ItemIndex:=cbTipo.Items.IndexOf(FieldByName('tipo').AsString);
      cbTipoChange(self);
      cbProduto.Enabled:=true;
      cbProduto.ItemIndex:=cbProduto.Items.IndexOf(Fields[1].AsString);
    end;
  end;
end;
//--------------------------------------------------------------------------
end.
