object FrmMovimentarEstoque: TFrmMovimentarEstoque
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o de Estoque'
  ClientHeight = 343
  ClientWidth = 525
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
    Width = 525
    Height = 285
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitTop = 61
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitWidth = 509
      ExplicitHeight = 250
      object PnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 517
        Height = 257
        Align = alClient
        Enabled = False
        TabOrder = 0
        ExplicitWidth = 509
        ExplicitHeight = 250
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
        object Label1: TLabel
          Left = 16
          Top = 98
          Width = 38
          Height = 13
          Caption = 'Produto'
        end
        object Label2: TLabel
          Left = 16
          Top = 52
          Width = 107
          Height = 13
          Caption = 'Tipo de Movimenta'#231#227'o'
        end
        object Label3: TLabel
          Left = 16
          Top = 146
          Width = 76
          Height = 13
          Caption = 'Local de Origem'
        end
        object Label4: TLabel
          Left = 16
          Top = 194
          Width = 78
          Height = 13
          Caption = 'Local de Destino'
        end
        object Label5: TLabel
          Left = 328
          Top = 52
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object EdtCodigoProduto: TEdit
          Left = 16
          Top = 117
          Width = 57
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          OnExit = EdtCodigoProdutoExit
        end
        object EdtDescricaoProduto: TEdit
          Left = 79
          Top = 117
          Width = 346
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object CbxTipoMovimentacao: TComboBox
          Left = 16
          Top = 71
          Width = 193
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 2
          Text = 'Movimenta'#231#227'o entre Locais'
          Items.Strings = (
            'Movimenta'#231#227'o entre Locais'
            'Entrada'
            'Sa'#237'da'
            '')
        end
        object EdtCodigoLocalOrigem: TEdit
          Left = 16
          Top = 165
          Width = 57
          Height = 21
          NumbersOnly = True
          TabOrder = 3
          OnExit = EdtCodigoLocalOrigemExit
        end
        object EdtDescricaoLocalOrigem: TEdit
          Left = 79
          Top = 165
          Width = 346
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object EdtCodigoLocalDestino: TEdit
          Left = 16
          Top = 213
          Width = 57
          Height = 21
          NumbersOnly = True
          TabOrder = 5
          OnExit = EdtCodigoLocalDestinoExit
        end
        object EdtDescricaoLocalDestino: TEdit
          Left = 79
          Top = 213
          Width = 346
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object EdtQuantidade: TEdit
          Left = 328
          Top = 71
          Width = 97
          Height = 21
          NumbersOnly = True
          TabOrder = 7
          OnExit = EdtCodigoProdutoExit
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      ExplicitWidth = 509
      ExplicitHeight = 250
      object DBGConsulta: TDBGrid
        Left = 16
        Top = 24
        Width = 481
        Height = 201
        DataSource = DM.DSMovimentosEstoque
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_MOVIMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_LOCAL_ORIGEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_LOCAL_DESTINO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_HORA'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 525
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
    ExplicitWidth = 517
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
      Top = 0
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
