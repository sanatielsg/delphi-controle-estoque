object FrmCadastroLocal: TFrmCadastroLocal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Locaiis'
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
  OnShow = FormShow
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
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object PnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 509
        Height = 250
        Align = alClient
        Enabled = False
        TabOrder = 0
        object Descrição: TLabel
          Left = 16
          Top = 53
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
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
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object DBGConsulta: TDBGrid
        Left = 16
        Top = 24
        Width = 481
        Height = 201
        DataSource = DM.DSLocais
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGConsultaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_BARRAS'
            Title.Caption = 'C'#243'digo de Barras'
            Visible = True
          end>
      end
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
    object BtnNovo: TSpeedButton
      Left = 4
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Novo'
      Enabled = False
      OnClick = BtnNovoClick
    end
    object BtnGravar: TSpeedButton
      Left = 71
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Gravar'
      Enabled = False
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TSpeedButton
      Left = 138
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Cancelar'
      Enabled = False
      OnClick = BtnCancelarClick
    end
    object BtnExcluir: TSpeedButton
      Left = 205
      Top = 3
      Width = 61
      Height = 52
      Caption = 'Excluir'
      Enabled = False
      OnClick = BtnExcluirClick
    end
  end
end
