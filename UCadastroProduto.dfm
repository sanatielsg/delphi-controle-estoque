﻿object FrmCadastroProduto: TFrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 336
  ClientWidth = 517
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
  object PageControl: TPageControl
    Left = 0
    Top = 58
    Width = 517
    Height = 278
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 72
    ExplicitWidth = 425
    ExplicitHeight = 193
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 20
      ExplicitTop = 96
      ExplicitWidth = 417
      ExplicitHeight = 165
      object PnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 509
        Height = 250
        Align = alClient
        Enabled = False
        TabOrder = 0
        ExplicitLeft = 10
        ExplicitTop = 32
        ExplicitWidth = 496
        ExplicitHeight = 209
        object Descrição: TLabel
          Left = 16
          Top = 53
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label1: TLabel
          Left = 16
          Top = 101
          Width = 82
          Height = 13
          Caption = 'C'#243'digo de Barras'
        end
        object LblCodigo: TLabel
          Left = 16
          Top = 8
          Width = 17
          Height = 39
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object EdtDescricao: TEdit
          Left = 16
          Top = 72
          Width = 449
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
        object EdtCodigoBarras: TEdit
          Left = 16
          Top = 120
          Width = 137
          Height = 21
          MaxLength = 14
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = -6
    object BtnNovo: TSpeedButton
      Left = 4
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Novo'
      Enabled = False
    end
    object BtnGravar: TSpeedButton
      Left = 71
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Gravar'
      Enabled = False
    end
    object BtnCancelar: TSpeedButton
      Left = 138
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Cancelar'
      Enabled = False
    end
    object BtnExcluir: TSpeedButton
      Left = 205
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Excluir'
      Enabled = False
    end
  end
end
