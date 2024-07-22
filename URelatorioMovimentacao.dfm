object FrmRelatorioMovimentacoes: TFrmRelatorioMovimentacoes
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Movimenta'#231#245'es'
  ClientHeight = 244
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 107
    Height = 13
    Caption = 'Tipo de Movimenta'#231#227'o'
  end
  object EdtCodigoProduto: TEdit
    Left = 16
    Top = 75
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object EdtDescricaoProduto: TEdit
    Left = 79
    Top = 75
    Width = 378
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object BtnGerar: TButton
    Left = 328
    Top = 200
    Width = 129
    Height = 25
    Caption = 'Gerar Relat'#243'rio'
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 24
    Width = 185
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 3
    Text = 'Transfer'#234'ncia entre Locais'
    Items.Strings = (
      'Transfer'#234'ncia entre Locais'
      'Entradas'
      'Sa'#237'das')
  end
end
