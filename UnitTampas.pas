unit UnitTampas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList;

type
  TFormTampas = class(TForm)
    DBGrid1: TDBGrid;
    dsTampas: TDataSource;
    sqlTampas: TFDQuery;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure pegaDados;


  public
    { Public declarations }
  end;

var
  FormTampas: TFormTampas;

implementation

{$R *.dfm}

uses UnitDM, UnitCadTampas;

procedure TFormTampas.acEditarExecute(Sender: TObject);
begin
  with TformCadTampas.create(self) do
  begin
    id := sqlTampas.FieldByName('id').AsString;
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormTampas.acExcluirExecute(Sender: TObject);
begin
  with dm.qu do
  begin
    close;
    SQL.Text := 'DELETE from tampas WHERE id = ' + sqlTampas.FieldByName('id').AsString;
    ExecSQL;
  end;
  pegaDados;
end;

procedure TFormTampas.acNovoExecute(Sender: TObject);
begin
  with TformCadTampas.create(self) do
  begin
    if showmodal = mrOK then
    begin

    end;
  end;
end;

procedure TFormTampas.Button1Click(Sender: TObject);
begin
    pegaDados;
end;

procedure TFormTampas.FormShow(Sender: TObject);
begin
  pegaDados;
  with sqlTampas do
  begin
    close;
    sql.Text := 'SELECT * FROM tampas';
    open;
  end;
end;

procedure TFormTampas.pegaDados;
begin
  with sqlTampas do
    begin
      close;
      sql.Text := 'SELECT * FROM tampas';
      Open;
    end;
end;

end.
