object FormPedido: TFormPedido
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 482
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 785
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 38
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acNovo
    end
    object ToolButton2: TToolButton
      Left = 38
      Top = 0
      Action = acEditar
    end
    object ToolButton3: TToolButton
      Left = 76
      Top = 0
      Action = acExcluir
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 785
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 472
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 66
    Width = 785
    Height = 416
    Align = alClient
    DataSource = dsPedidos
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ActionList1: TActionList
    Left = 480
    Top = 216
    object acNovo: TAction
      Caption = 'Novo'
      OnExecute = acNovoExecute
    end
    object acEditar: TAction
      Caption = 'Editar'
      OnExecute = acEditarExecute
    end
    object acExcluir: TAction
      Caption = 'Excluir'
      OnExecute = acExcluirExecute
    end
  end
  object sqlPedidos: TFDQuery
    Connection = DM.ConexaoEstoque
    SQL.Strings = (
      'SELECT '
      #9'id, '
      '    CASE '
      '    '#9'WHEN tipo = '#39'Tampa'#39' THEN'
      '    '#9#9'(select descricao from tampas where id = id_produto)'
      '       '#9'WHEN tipo = '#39'Frasco'#39' THEN'
      '     '#9#9'(select descricao from frascos where id = id_produto)'
      '        ELSE'
      '        '#9#39'NADA ENCONTRADO'#39
      '        END as Produto,'
      
        '        (select nome from cliente where id = id_cliente) cliente' +
        ', '
      '        tipo, quantidade, valor_unitario, valor_total, status'
      'FROM `pedido`')
    Left = 664
    Top = 328
  end
  object dsPedidos: TDataSource
    DataSet = sqlPedidos
    Left = 664
    Top = 392
  end
end
