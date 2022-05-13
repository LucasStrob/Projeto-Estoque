unit UnitFrasco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormFrascos = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    sqlFrascos: TFDQuery;
    dsFrascos: TDataSource;
    procedure acNovoExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

  FormFrascos: TFormFrascos;

implementation

{$R *.dfm}

uses UnitCadFrascos, UnitDM;

procedure TFormFrascos.acEditarExecute(Sender: TObject);
begin
  with TformCadFrascos.Create(self) do
  begin
    id := sqlFrascos.FieldByName('id').AsString;
    if ShowModal = mrOK then
  end;
end;

procedure TFormFrascos.acExcluirExecute(Sender: TObject);
begin
  with dm.qu do
  begin
    close;
    SQL.Text := 'DELETE from frascos WHERE id = ' + sqlFrascos.FieldByName('id').AsString;
    ExecSQL;
  end;
  pegaDados;
end;

procedure TFormFrascos.acNovoExecute(Sender: TObject);
begin
  with TFormCadFrascos.create(self) do
  begin
    if showmodal = mrOK then
    begin

    end;
  end;
end;



procedure TFormFrascos.Button1Click(Sender: TObject);
begin
  pegaDados;
end;

procedure TFormFrascos.FormShow(Sender: TObject);
begin
  pegaDados;
end;

procedure TFormFrascos.pegadados;
begin
  with sqlFrascos do
  begin
    close;
    sql.Text := 'SELECT * FROM frascos';
    Open;
  end;
end;





end.
