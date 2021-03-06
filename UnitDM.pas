unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    ConexaoEstoque: TFDConnection;
    tbProdutos: TFDTable;
    tbMovimentacao: TFDTable;
    tbMovimentacaoProdutos: TFDTable;
    dsProdutos: TDataSource;
    dsMovimentacao: TDataSource;
    dsMovimentacaoProdutos: TDataSource;
    tbProdutosid: TFDAutoIncField;
    tbProdutosnome: TStringField;
    tbProdutosfabricante: TStringField;
    tbProdutosvalidade: TDateField;
    tbProdutosestoqueAtual: TIntegerField;
    tbMovimentacaoid: TFDAutoIncField;
    tbMovimentacaotipo: TStringField;
    tbMovimentacaodataHora: TDateTimeField;
    tbMovimentacaoresponsavel: TStringField;
    tbMovimentacaoobservacoes: TMemoField;
    tbMovimentacaoProdutosid: TFDAutoIncField;
    tbMovimentacaoProdutosidmovimentacao: TIntegerField;
    tbMovimentacaoProdutosidproduto: TIntegerField;
    tbMovimentacaoProdutosqtd: TIntegerField;
    SqlAumentaEstoque: TFDCommand;
    SqlDiminuiEstoque: TFDCommand;
    SqlMovimentacoes: TFDQuery;
    dsSqlMovimentacoes: TDataSource;
    qu: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

end.
