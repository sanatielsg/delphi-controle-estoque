unit UCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroProduto: TFrmCadastroProduto;

implementation

{$R *.dfm}

end.
