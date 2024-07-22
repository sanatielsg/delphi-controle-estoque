unit URelatorioMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmRelatorioMovimentacoes = class(TForm)
    EdtCodigoProduto: TEdit;
    Label1: TLabel;
    EdtDescricaoProduto: TEdit;
    BtnGerar: TButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioMovimentacoes: TFrmRelatorioMovimentacoes;

implementation

{$R *.dfm}

end.
