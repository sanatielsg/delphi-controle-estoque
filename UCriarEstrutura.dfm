object FrmCriarEstrutura: TFrmCriarEstrutura
  Left = 0
  Top = 0
  Caption = 'Criar Estruturas'
  ClientHeight = 341
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 135
    Height = 13
    Caption = 'Caminho do banco de dados'
  end
  object EdtCaminhoBanco: TEdit
    Left = 8
    Top = 24
    Width = 362
    Height = 21
    TabOrder = 0
    Text = 'C:\database\ESTOQUE.FDB'
  end
  object BtnDialog: TButton
    Left = 376
    Top = 22
    Width = 63
    Height = 25
    Caption = 'Abrir'
    TabOrder = 1
  end
  object BtnExecutar: TButton
    Left = 144
    Top = 64
    Width = 129
    Height = 25
    Caption = 'Executar Cria'#231#227'o'
    TabOrder = 2
    OnClick = BtnExecutarClick
  end
  object MmoStatus: TMemo
    Left = 8
    Top = 95
    Width = 431
    Height = 238
    Lines.Strings = (
      'Pronto.')
    TabOrder = 3
  end
  object OpenDialog: TOpenDialog
    Left = 320
    Top = 48
  end
end
