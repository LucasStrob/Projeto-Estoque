object FormTampas: TFormTampas
  Left = 0
  Top = 0
  Caption = 'Cadastro Tampas'
  ClientHeight = 455
  ClientWidth = 718
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 83
    Width = 718
    Height = 372
    Align = alClient
    DataSource = dsTampas
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 718
    Height = 58
    Align = alTop
    TabOrder = 1
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 718
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
    Left = 504
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object dsTampas: TDataSource
    DataSet = sqlTampas
    Left = 640
    Top = 384
  end
  object sqlTampas: TFDQuery
    Connection = DM.ConexaoEstoque
    SQL.Strings = (
      'SELECT * '
      'FROM tampas'
      '')
    Left = 640
    Top = 336
  end
  object ActionList1: TActionList
    Left = 368
    Top = 160
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
end
