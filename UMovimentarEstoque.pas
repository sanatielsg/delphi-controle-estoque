unit UMovimentarEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UDM;

type
  TFrmMovimentarEstoque = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BtnNovo: TSpeedButton;
    BtnGravar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    PnlCadastro: TPanel;
    LblCodigo: TLabel;
    DBGConsulta: TDBGrid;
    EdtCodigoProduto: TEdit;
    EdtDescricaoProduto: TEdit;
    Label1: TLabel;
    CbxTipoMovimentacao: TComboBox;
    Label2: TLabel;
    EdtCodigoLocalOrigem: TEdit;
    EdtDescricaoLocalOrigem: TEdit;
    Label3: TLabel;
    EdtCodigoLocalDestino: TEdit;
    EdtDescricaoLocalDestino: TEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGConsultaDblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtCodigoProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetStatusBotoes(AStatus : Integer);
    procedure LimparCampos();
    function FormularioValido: Boolean;
    procedure Gravar(ACodigo : string);
  end;

var
  FrmMovimentarEstoque: TFrmMovimentarEstoque;

implementation

{$R *.dfm}

{ TFrmMovimentarEstoque }

procedure TFrmMovimentarEstoque.BtnCancelarClick(Sender: TObject);
begin
  SetStatusBotoes(1);
  LimparCampos;
  PnlCadastro.Enabled := False;
end;

procedure TFrmMovimentarEstoque.BtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem Certeza?', 'excluir?',MB_YESNO) = ID_YES then
  begin
    DM.ExcluirLocal(StrToInt(LblCodigo.Caption));
    DM.QryLocais.Close;
    DM.QryLocais.Open();
    SetStatusBotoes(1);
    LimparCampos;
  end;
  PnlCadastro.Enabled := False;
end;

procedure TFrmMovimentarEstoque.BtnGravarClick(Sender: TObject);
begin
  if FormularioValido then
  begin
    Gravar(LblCodigo.Caption);
    DM.QryLocais.Close;
    DM.QryLocais.Open();
    SetStatusBotoes(1);
    LimparCampos;
    PnlCadastro.Enabled := False;
  end
  else
  ShowMessage('Preenchimento Inv�lido!');
end;

procedure TFrmMovimentarEstoque.BtnNovoClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  SetStatusBotoes(2);
  PnlCadastro.Enabled := True;
  CbxTipoMovimentacao.SetFocus;
end;

procedure TFrmMovimentarEstoque.DBGConsultaDblClick(Sender: TObject);
begin
  SetStatusBotoes(3);
  LblCodigo.Caption := DM.QryLocaisCODIGO.AsString;

  EdtCodigoProduto.Text := DM.QryMovimentosEstoqueCOD_PRODUTO.AsString;
  CbxTipoMovimentacao.ItemIndex := DM.QryMovimentosEstoqueTIPO_MOVIMENTO.AsInteger;
  EdtCodigoProduto.Text := DM.QryMovimentosEstoqueCOD_PRODUTO.AsString;
  EdtDescricaoProduto.Text := DM.QryMovimentosEstoqueNOME_PRODUTO.AsString;
  EdtCodigoLocalOrigem.Text :=  DM.QryMovimentosEstoqueCOD_LOCAL_ORIGEM.AsString;
  EdtDescricaoLocalOrigem.Text := DM.QryMovimentosEstoqueNOME_LOCAL_ORIGEM.AsString;
  EdtCodigoLocalDestino.Text :=  DM.QryMovimentosEstoqueCOD_LOCAL_DESTINO.AsString;
  EdtDescricaoLocalDestino.Text := DM.QryMovimentosEstoqueNOME_LOCAL_DESTINO.AsString;
  PnlCadastro.Enabled := True;
end;

procedure TFrmMovimentarEstoque.EdtCodigoProdutoExit(Sender: TObject);
begin
  if(EdtCodigoProduto.Text <> '') then
  begin
   EdtDescricaoProduto.Text := DM.GetDescricaoProduto(StrToInt(EdtCodigoProduto.Text));
  end;
end;

procedure TFrmMovimentarEstoque.FormShow(Sender: TObject);
begin
  SetStatusBotoes(1);
  DM.QryLocais.Open();
end;

function TFrmMovimentarEstoque.FormularioValido: Boolean;
begin
//  if EdtDescricao.Text <> '' then
//    Result:= True
//  else
//    Result := False;
end;

procedure TFrmMovimentarEstoque.Gravar(ACodigo: string);
begin
//  if(ACodigo = '0') then
//    DM.InserirLocal(EdtDescricao.Text)
//  else
//    DM.AlterarLocal( StrToInt(LblCodigo.Caption),EdtDescricao.Text);
end;

procedure TFrmMovimentarEstoque.LimparCampos;
begin
//  EdtDescricao.Text := '';
end;

procedure TFrmMovimentarEstoque.SetStatusBotoes(AStatus: Integer);
begin
  case AStatus of

    1: begin //entrando na tela
      LblCodigo.Visible := False;
      LblCodigo.Caption := '0';
      BtnNovo.Enabled := True;
      BtnGravar.Enabled := False;
      BtnCancelar.Enabled := False;
      BtnExcluir.Enabled := False;
      PageControl.ActivePageIndex := 0;
    end;

    2: begin //clicou Novo
      LblCodigo.Visible := False;
      LblCodigo.Caption := '0';
      BtnNovo.Enabled := False;
      BtnGravar.Enabled := True;
      BtnCancelar.Enabled := True;
      BtnExcluir.Enabled := False;
    end;

    3: begin //vindo da Pesquisa
      LblCodigo.Visible := True;
      BtnNovo.Enabled := False;
      BtnGravar.Enabled := True;
      BtnCancelar.Enabled := True;
      BtnExcluir.Enabled := True;
      PageControl.ActivePageIndex := 0;
    end;

  end;


end;

end.