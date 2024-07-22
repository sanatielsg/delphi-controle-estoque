unit UCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UDM;

type
  TFrmCadastroProduto = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BtnNovo: TSpeedButton;
    BtnGravar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    PnlCadastro: TPanel;
    EdtDescricao: TEdit;
    Descri��o: TLabel;
    Label1: TLabel;
    EdtCodigoBarras: TEdit;
    LblCodigo: TLabel;
    DBGConsulta: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGConsultaDblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
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
  FrmCadastroProduto: TFrmCadastroProduto;

implementation

{$R *.dfm}

{ TFrmCadastroProduto }

procedure TFrmCadastroProduto.BtnCancelarClick(Sender: TObject);
begin
  SetStatusBotoes(1);
  LimparCampos;
  PnlCadastro.Enabled := False;
end;

procedure TFrmCadastroProduto.BtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem Certeza?', 'excluir?',MB_YESNO) = ID_YES then
  begin

    DM.QryProdutos.Close;
    DM.QryProdutos.Open();
    SetStatusBotoes(1);
    LimparCampos;
  end;
  PnlCadastro.Enabled := False;
end;

procedure TFrmCadastroProduto.BtnGravarClick(Sender: TObject);
begin
  if FormularioValido then
  begin
    Gravar(LblCodigo.Caption);
    DM.QryProdutos.Close;
    DM.QryProdutos.Open();
    SetStatusBotoes(1);
    LimparCampos;
    PnlCadastro.Enabled := False;
  end
  else
  ShowMessage('Preenchimento Inv�lido!');
end;

procedure TFrmCadastroProduto.BtnNovoClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  SetStatusBotoes(2);
  PnlCadastro.Enabled := True;
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastroProduto.DBGConsultaDblClick(Sender: TObject);
begin
  SetStatusBotoes(3);
  {LblCodigo.Caption := '10'; //teste
  EdtDescricao.Text := 'COCA COLA 2000ML';
  EdtCodigoBarras.Text := '7894900011517';}
  LblCodigo.Caption := DM.QryProdutosCODIGO.AsString;
  EdtDescricao.Text := DM.QryProdutosDESCRICAO.AsString;
  EdtCodigoBarras.Text := DM.QryProdutosCODIGO_BARRAS.AsString;
  PnlCadastro.Enabled := True;
end;

procedure TFrmCadastroProduto.FormShow(Sender: TObject);
begin
  SetStatusBotoes(1);
  DM.QryProdutos.Open();
end;

function TFrmCadastroProduto.FormularioValido: Boolean;
begin
  if EdtDescricao.Text <> '' then
    Result:= True
  else
    Result := False;
end;

procedure TFrmCadastroProduto.Gravar(ACodigo: string);
begin
  if(ACodigo = '0') then
    DM.InserirProduto(EdtDescricao.Text, EdtCodigoBarras.Text )
  else
    DM.AlterarProduto( StrToInt(LblCodigo.Caption),EdtDescricao.Text, EdtCodigoBarras.Text );
end;

procedure TFrmCadastroProduto.LimparCampos;
begin
  EdtDescricao.Text := '';
  EdtCodigoBarras.Text := '';
end;

procedure TFrmCadastroProduto.SetStatusBotoes(AStatus: Integer);
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
