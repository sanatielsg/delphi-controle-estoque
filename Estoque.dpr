program Estoque;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCriarEstrutura in 'UCriarEstrutura.pas' {FrmCriarEstrutura};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCriarEstrutura, FrmCriarEstrutura);
  Application.Run;
end.
