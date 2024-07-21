unit UCriarEstrutura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmCriarEstrutura = class(TForm)
    EdtCaminhoBanco: TEdit;
    Label1: TLabel;
    BtnDialog: TButton;
    BtnExecutar: TButton;
    MmoStatus: TMemo;
    OpenDialog: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCriarEstrutura: TFrmCriarEstrutura;

implementation

{$R *.dfm}

procedure TFrmCriarEstrutura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
