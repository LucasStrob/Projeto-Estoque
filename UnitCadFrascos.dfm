object FormCadFrascos: TFormCadFrascos
  Left = 0
  Top = 0
  Caption = 'Cadastrar Frascos'
  ClientHeight = 261
  ClientWidth = 503
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
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 62
    Height = 13
    Caption = 'Nome Frasco'
  end
  object edFrasco: TEdit
    Left = 48
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 31
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
