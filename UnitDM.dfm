object DM: TDM
  OldCreateOrder = False
  Height = 484
  Width = 628
  object ConexaoEstoque: TFDConnection
    Params.Strings = (
      'Database=testeprojeto'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 120
  end
  object tbProdutos: TFDTable
    IndexFieldNames = 'id'
    Connection = ConexaoEstoque
    UpdateOptions.UpdateTableName = 'estoque.produtos'
    TableName = 'estoque.produtos'
    Left = 200
    Top = 120
    object tbProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tbProdutosfabricante: TStringField
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Required = True
      Size = 50
    end
    object tbProdutosvalidade: TDateField
      FieldName = 'validade'
      Origin = 'validade'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object tbProdutosestoqueAtual: TIntegerField
      FieldName = 'estoqueAtual'
      Origin = 'estoqueAtual'
    end
  end
  object tbMovimentacao: TFDTable
    IndexFieldNames = 'id'
    Connection = ConexaoEstoque
    UpdateOptions.UpdateTableName = 'estoque.movimentacoes'
    TableName = 'estoque.movimentacoes'
    Left = 312
    Top = 120
    object tbMovimentacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbMovimentacaotipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object tbMovimentacaodataHora: TDateTimeField
      FieldName = 'dataHora'
      Origin = 'dataHora'
      Required = True
    end
    object tbMovimentacaoresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Required = True
      Size = 50
    end
    object tbMovimentacaoobservacoes: TMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Required = True
      BlobType = ftMemo
    end
  end
  object tbMovimentacaoProdutos: TFDTable
    IndexFieldNames = 'id'
    Connection = ConexaoEstoque
    UpdateOptions.UpdateTableName = 'estoque.movimentacoes_produtos'
    TableName = 'estoque.movimentacoes_produtos'
    Left = 448
    Top = 120
    object tbMovimentacaoProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbMovimentacaoProdutosidmovimentacao: TIntegerField
      FieldName = 'idmovimentacao'
      Origin = 'idmovimentacao'
      Required = True
    end
    object tbMovimentacaoProdutosidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
    end
    object tbMovimentacaoProdutosqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = tbProdutos
    Left = 200
    Top = 168
  end
  object dsMovimentacao: TDataSource
    DataSet = tbMovimentacao
    Left = 312
    Top = 168
  end
  object dsMovimentacaoProdutos: TDataSource
    DataSet = tbMovimentacaoProdutos
    Left = 448
    Top = 168
  end
  object SqlAumentaEstoque: TFDCommand
    Connection = ConexaoEstoque
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 192
    Top = 248
  end
  object SqlDiminuiEstoque: TFDCommand
    Connection = ConexaoEstoque
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 192
    Top = 312
  end
  object SqlMovimentacoes: TFDQuery
    Connection = ConexaoEstoque
    SQL.Strings = (
      'SELECT * FROM movimentacoes')
    Left = 336
    Top = 248
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = SqlMovimentacoes
    Left = 336
    Top = 312
  end
  object qu: TFDQuery
    Connection = ConexaoEstoque
    SQL.Strings = (
      'SELECT * '
      'FROM tampas'
      '')
    Left = 205
    Top = 43
  end
end
