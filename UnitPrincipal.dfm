object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Controle de Estoque'
  ClientHeight = 443
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 24
    ExplicitWidth = 185
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 136
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object CadastrodeProdutos1: TMenuItem
        Caption = 'Cadastro de Produtos'
        OnClick = CadastrodeProdutos1Click
      end
      object CadastroTampas1: TMenuItem
        Caption = 'Cadastro Tampas'
        OnClick = CadastroTampas1Click
      end
      object CadastroFrascos1: TMenuItem
        Caption = 'Cadastro Frascos'
        OnClick = CadastroFrascos1Click
      end
      object CadastroCliente1: TMenuItem
        Caption = 'Cadastro Cliente'
        OnClick = CadastroCliente1Click
      end
      object CadastroPedido1: TMenuItem
        Caption = 'Cadastro Pedido'
        OnClick = CadastroPedido1Click
      end
    end
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object GerenciarMovimentaes1: TMenuItem
        Caption = 'Gerenciar Movimenta'#231#245'es'
        OnClick = GerenciarMovimentaes1Click
      end
      object ConsultarMovimentaes1: TMenuItem
        Caption = 'Consultar Movimenta'#231#245'es'
        OnClick = ConsultarMovimentaes1Click
      end
      object ConsultarMovimentaes2: TMenuItem
      end
    end
  end
end
