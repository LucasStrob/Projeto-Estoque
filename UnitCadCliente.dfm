object FormCadCliente: TFormCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro Cliente'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 57
    Height = 13
    Caption = 'Nome Social'
  end
  object Label2: TLabel
    Left = 48
    Top = 88
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object edNome: TEdit
    Left = 48
    Top = 43
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object edCnpj: TEdit
    Left = 48
    Top = 107
    Width = 161
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 48
    Top = 152
    Width = 97
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 152
    Width = 97
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = Button2Click
  end
end
