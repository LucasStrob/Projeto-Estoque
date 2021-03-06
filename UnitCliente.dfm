object FormCliente: TFormCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro Cliente'
  ClientHeight = 489
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultSizeOnly
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 793
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 66
    Width = 793
    Height = 423
    Align = alClient
    DataSource = dsCliente
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 793
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 38
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 2
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
  object Button1: TButton
    Left = 472
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ActionList1: TActionList
    Left = 488
    Top = 168
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
  object sqlCliente: TFDQuery
    Active = True
    Connection = DM.ConexaoEstoque
    SQL.Strings = (
      'SELECT * FROM cliente')
    Left = 664
    Top = 320
  end
  object dsCliente: TDataSource
    DataSet = sqlCliente
    Left = 664
    Top = 376
  end
end
