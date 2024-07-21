unit UCriarEstrutura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDM;

type
  TFrmCriarEstrutura = class(TForm)
    EdtCaminhoBanco: TEdit;
    Label1: TLabel;
    BtnDialog: TButton;
    BtnExecutar: TButton;
    MmoStatus: TMemo;
    OpenDialog: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriarEstrutura();
  end;

var
  FrmCriarEstrutura: TFrmCriarEstrutura;

implementation

{$R *.dfm}

procedure TFrmCriarEstrutura.BtnExecutarClick(Sender: TObject);
begin
  CriarEstrutura();
end;

procedure TFrmCriarEstrutura.CriarEstrutura;
begin
  MmoStatus.Lines.Clear;
  MmoStatus.Lines.Add('Conectando...');
  DM.Conectar(EdtCaminhoBanco.Text);
  MmoStatus.Lines.Add('Conectado!');
  MmoStatus.Lines.Add('Criando estruturas...');
  DM.CriarEstrutura;
  MmoStatus.Lines.Add('Estruturas criadas!');
end;

procedure TFrmCriarEstrutura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
