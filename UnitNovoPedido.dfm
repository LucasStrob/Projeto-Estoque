object FormNovoPedido: TFormNovoPedido
  Left = 0
  Top = 0
  Caption = 'Cadastrar Cliente'
  ClientHeight = 360
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object label2: TLabel
    Left = 40
    Top = 104
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label3: TLabel
    Left = 40
    Top = 168
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label4: TLabel
    Left = 40
    Top = 293
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label6: TLabel
    Left = 40
    Top = 232
    Width = 64
    Height = 13
    Caption = 'Valor Unit'#225'rio'
  end
  object Label7: TLabel
    Left = 216
    Top = 293
    Width = 54
    Height = 13
    Caption = 'Valor Total '
  end
  object Label8: TLabel
    Left = 216
    Top = 168
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label9: TLabel
    Left = 197
    Top = 315
    Width = 13
    Height = 13
    Caption = 'R$'
  end
  object Label10: TLabel
    Left = 21
    Top = 254
    Width = 13
    Height = 13
    Caption = 'R$'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 247
      Height = 33
      Caption = 'Cadastrar Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 312
      Top = 18
      Width = 97
      Height = 40
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object cbTipo: TComboBox
    Left = 40
    Top = 187
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = cbTipoChange
    Items.Strings = (
      'Tampa'
      'Frasco')
  end
  object cbCliente: TComboBox
    Left = 40
    Top = 123
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
  end
  object cbProduto: TComboBox
    Left = 216
    Top = 187
    Width = 145
    Height = 21
    Style = csDropDownList
    Enabled = False
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 408
    Top = 73
    Width = 231
    Height = 287
    Align = alRight
    DataSource = FormPedido.dsPedidos
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edValorUnitario: TMaskEdit
    Left = 40
    Top = 251
    Width = 121
    Height = 21
    TabOrder = 5
    Text = ''
    OnKeyUp = edValorUnitarioKeyUp
  end
  object edQuantidade: TMaskEdit
    Left = 40
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 6
    Text = ''
    OnKeyUp = edQuantidadeKeyUp
  end
  object edValorTotal: TEdit
    Left = 216
    Top = 312
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
end
