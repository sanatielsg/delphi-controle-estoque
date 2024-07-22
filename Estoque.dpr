program Estoque;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCriarEstrutura in 'UCriarEstrutura.pas' {FrmCriarEstrutura},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadastroProduto in 'UCadastroProduto.pas' {FrmCadastroProduto},
  UCadastroLocal in 'UCadastroLocal.pas' {FrmCadastroLocal},
  UMovimentarEstoque in 'UMovimentarEstoque.pas' {FrmMovimentarEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCriarEstrutura, FrmCriarEstrutura);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmCadastroProduto, FrmCadastroProduto);
  Application.CreateForm(TFrmCadastroLocal, FrmCadastroLocal);
  Application.CreateForm(TFrmMovimentarEstoque, FrmMovimentarEstoque);
  Application.Run;
end.
