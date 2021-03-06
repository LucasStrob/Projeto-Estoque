unit UnitCadTampas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCadTampas = class(TForm)
    Label1: TLabel;
    edTampa: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id : string;
  end;

var
  FormCadTampas: TFormCadTampas;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFormCadTampas.Button1Click(Sender: TObject);
begin
  if edTampa.Text = '' then
  begin
    ShowMessage('O Campo Nome N?o Pode Ficar Vazio');
    exit;
  end;

  with dm.qu do
  begin
    close;
    if id <> '' then
    begin
      SQL.Text := 'UPDATE tampas SET descricao = ' +QuotedStr(edTampa.Text)+' WHERE id = ' + id;
    end
    else
    begin
      sql.Text :=  'INSERT INTO tampas(descricao) VALUES ('+QuotedStr(edTampa.Text)+')';
    end;

    ExecSQL;
  end;

   Close;
end;

procedure TFormCadTampas.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCadTampas.FormShow(Sender: TObject);
begin
  if id <> '' then
  begin
    with dm.qu do
    begin
      close;
      SQL.Text := 'SELECT descricao FROM tampas WHERE id = ' + id;
      open;
      edTampa.Text := FieldByName('descricao').AsString;
    end;
  end;
end;

end.
