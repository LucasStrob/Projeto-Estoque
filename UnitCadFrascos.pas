unit UnitCadFrascos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormCadFrascos = class(TForm)
    edFrasco: TEdit;
    Label1: TLabel;
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
  FormCadFrascos: TFormCadFrascos;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFormCadFrascos.Button1Click(Sender: TObject);
begin
  if edFrasco.Text = '' then
  begin
    ShowMessage('O campo Nome n?o pode ficar vazio');
    exit;
  end;
    close;
    with dm.qu do
    begin
      close;
      if id <> '' then
      begin
        SQL.Text := 'UPDATE frascos SET descricao = ' +QuotedStr(edFrasco.Text)+' WHERE id = ' + id;
      end
      else
      begin
        sql.Text :=  'INSERT INTO frascos(descricao) VALUES ('+QuotedStr(edFrasco.Text)+')';
      end;

    ExecSQL;

  end;

end;

procedure TFormCadFrascos.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFormCadFrascos.FormShow(Sender: TObject);
begin
  if id <> '' then
  begin
    with dm.qu do
    begin
      close;
      SQL.Text := 'SELECT descricao FROM  frascos WHERE id = ' + id;
      open;
      edFrasco.Text := FieldByName('descricao').AsString;
    end;
  end;
end;

end.
