unit UnitCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormCadCliente = class(TForm)
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edCnpj: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    contador : integer;
  public
    { Public declarations }
    id : string;
  end;

var
  FormCadCliente: TFormCadCliente;


implementation

{$R *.dfm}

uses UnitDM, UnitCliente;

procedure TFormCadCliente.Button1Click(Sender: TObject);
begin
  if edNome.Text = '' then
  begin
    ShowMessage('O campo Nome N?o Pode Ficar Vazios');
    exit;
  end;
  if edCnpj.Text = '' then
  begin
    ShowMessage('O Campo CNPJ N?o Pode Ficar V?zio');
    exit;
  end;

  // VERIFICA SE CNPJ JA ESTA CADASTRADO
    with dm.qu do
    begin
      Close;
      if id = '' then
        sql.Text := 'SELECT cnpj FROM cliente where ' +
                  'cnpj = ' +edCnpj.Text
      else
        sql.Text := 'SELECT cnpj FROM cliente where ' +
                  'cnpj = ' +edCnpj.Text + ' and id <> ' + id;
      Open;
      if FieldByName('cnpj').AsString = edCnpj.Text then
      begin
        ShowMessage('Este CNPJ possui Cadastrado!');
        Exit;
      end
    end;
  //-------------------------------------
  // INSERE OS DADOS DENTRO DO BANCO DE DADOS
  with  dm.qu do
    begin
      Close;
      if id <> '' then
      begin
        SQL.Text := 'UPDATE cliente SET nome = ' +QuotedStr(edNome.Text )+
                                     ', cnpj = ' +QuotedStr(edCnpj.Text)+
                                     ' WHERE id = ' + id;


      end
      else
      begin
        sql.Text :=  'INSERT INTO cliente(cnpj, nome) VALUES ('+edCnpj.Text+','
        +QuotedStr(edNome.Text)+ ')';
      end;
      ExecSQL;
    end;

    Close;
end;

procedure TFormCadCliente.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFormCadCliente.FormShow(Sender: TObject);
begin
  if id <> '' then
  begin
    with dm.qu do
    begin
      close;
      SQL.Text := 'SELECT * FROM cliente WHERE id = '+ id;
      open;
      edNome.Text := FieldByName('nome').AsString;
      edCnpj.Text := FieldByName('cnpj').AsString;
    end;
  end;
end;

end.
