object FormFrascos: TFormFrascos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Frasco'
  ClientHeight = 419
  ClientWidth = 717
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
    Width = 717
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 38
    Caption = 'ToolBar1'
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
    Width = 717
    Height = 58
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 160
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 83
    Width = 717
    Height = 336
    Align = alClient
    DataSource = dsFrascos
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ActionList1: TActionList
    Left = 384
    Top = 144
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
  object sqlFrascos: TFDQuery
    Connection = DM.ConexaoEstoque
    SQL.Strings = (
      'SELECT * '
      'FROM frascos'
      '')
    Left = 608
    Top = 272
  end
  object dsFrascos: TDataSource
    DataSet = sqlFrascos
    Left = 608
    Top = 328
  end
end
