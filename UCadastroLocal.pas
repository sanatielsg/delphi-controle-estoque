unit UCadastroLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UDM;

type
  TFrmCadastroLocal = class(TForm)
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
  FrmCadastroLocal: TFrmCadastroLocal;

implementation

{$R *.dfm}

{ TFrmCadastroLocal }

procedure TFrmCadastroLocal.BtnCancelarClick(Sender: TObject);
begin
  SetStatusBotoes(1);
  LimparCampos;
  PnlCadastro.Enabled := False;
end;

procedure TFrmCadastroLocal.BtnExcluirClick(Sender: TObject);
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

procedure TFrmCadastroLocal.BtnGravarClick(Sender: TObject);
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

procedure TFrmCadastroLocal.BtnNovoClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  SetStatusBotoes(2);
  PnlCadastro.Enabled := True;
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastroLocal.DBGConsultaDblClick(Sender: TObject);
begin
  SetStatusBotoes(3);
  LblCodigo.Caption := DM.QryLocaisCODIGO.AsString;
  EdtDescricao.Text := DM.QryLocaisDESCRICAO.AsString;
  PnlCadastro.Enabled := True;
end;

procedure TFrmCadastroLocal.FormShow(Sender: TObject);
begin
  SetStatusBotoes(1);
  DM.QryLocais.Open();
end;

function TFrmCadastroLocal.FormularioValido: Boolean;
begin
  if EdtDescricao.Text <> '' then
    Result:= True
  else
    Result := False;
end;

procedure TFrmCadastroLocal.Gravar(ACodigo: string);
begin
  if(ACodigo = '0') then
    DM.InserirLocal(EdtDescricao.Text)
  else
    DM.AlterarLocal( StrToInt(LblCodigo.Caption),EdtDescricao.Text);
end;

procedure TFrmCadastroLocal.LimparCampos;
begin
  EdtDescricao.Text := '';
end;

procedure TFrmCadastroLocal.SetStatusBotoes(AStatus: Integer);
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
