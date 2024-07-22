unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Con: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    QryComum: TFDQuery;
    QryProdutos: TFDQuery;
    QryProdutosCODIGO: TIntegerField;
    QryProdutosDESCRICAO: TStringField;
    QryProdutosCODIGO_BARRAS: TStringField;
    DSProdutos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conectar(ACaminhoBanco : string);
    procedure CriarEstrutura();
    procedure Execute(ASql : string);
    procedure InserirProduto(ADescricao, ACodigoBarras: string);
    procedure InserirLocal(ADescricao: string);
    procedure InserirMovimentoProduto(
      ACodigoProduto, ALocalOrigem, ALocalDestino: Integer; AQuantidade: Double);
    function NextSeq(ASequence : string) : Integer;
    procedure AlterarProduto(ACodigo: Integer;  ADescricao, ACodigoBarras: string);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }



{ TDM }

procedure TDM.AlterarProduto(ACodigo: Integer; ADescricao,
  ACodigoBarras: string);
  var ASql : string;
begin
  ASql := 'UPDATE PRODUTO SET DESCRICAO = :descricao, ' +
  'CODIGO_BARRAS = :codigo_barras WHERE CODIGO = :codigo ';
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASql);
    ParamByName('descricao').AsString := ADescricao;
    ParamByName('codigo_barras').AsString := ACodigoBarras;
    ParamByName('codigo').AsInteger := ACodigo;
    ExecSQL;
  end;
end;

procedure TDM.Conectar(ACaminhoBanco : string);
begin
  if(not Con.Connected) then
  begin
    with Con.Params do
    begin
      Clear;
      Add('DriverID=FB');
      Add('Database='+ACaminhoBanco);
      Add('User_Name=SYSDBA');
      Add('Password=masterkey');
    end;
    Con.Connected := True;
  end;
end;

procedure TDM.CriarEstrutura;
  var ASql : string;
begin
  ASql := 'CREATE TABLE PRODUTO(' +
          'CODIGO        INTEGER NOT NULL PRIMARY KEY,' +
          'DESCRICAO     VARCHAR(100) NOT NULL,' +
          'CODIGO_BARRAS VARCHAR(14)' +
          ')';
  Execute(ASql);

  ASql := 'CREATE TABLE LOCAL(' +
          'CODIGO    INTEGER NOT NULL PRIMARY KEY,'+
          'DESCRICAO VARCHAR(50) NOT NULL'+
          ')';
  Execute(ASql);

  ASql := 'CREATE TABLE MOVIMENTO_PRODUTO(' +
          'CODIGO            INTEGER NOT NULL PRIMARY KEY,'+
          'COD_PRODUTO       INTEGER NOT NULL,'+
          'COD_LOCAL_ORIGEM  INTEGER NOT NULL,' +
          'COD_LOCAL_DESTINO INTEGER NOT NULL,' +
          'QUANTIDADE        NUMERIC(15,3) NOT NULL,' +
          'DATA_HORA         TIMESTAMP DEFAULT CURRENT_TIMESTAMP' +
          ')';
  Execute(ASql);

  ASql := 'create sequence SEQ_PRODUTO';
  Execute(ASql);

  ASql := 'create sequence SEQ_LOCAL';
  Execute(ASql);

  ASql := 'create sequence SEQ_MOVIMENTO_PRODUTO';
  Execute(ASql);
end;

procedure TDM.Execute(ASql: string);
begin
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASql);
    ExecSQL;
  end;
end;

procedure TDM.InserirLocal(ADescricao: string);
  var ASql : string;
begin
  ASql := 'INSERT INTO LOCAL (DESCRICAO) VALUES (:descricao)';
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASql);
    ParamByName('descricao').AsString := ADescricao;
    ExecSQL;
  end;
end;

procedure TDM.InserirMovimentoProduto(ACodigoProduto, ALocalOrigem,
  ALocalDestino: Integer; AQuantidade: Double);
  var ASql : string;
begin
  ASql := 'INSERT INTO MOVIMENTO_PRODUTO (' +
          'COD_PRODUTO, COD_LOCAL_ORIGEM, COD_LOCAL_DESTINO, QUANTIDADE' +
          ')' +
          'VALUES (:cod_produto, :cod_local_origem, :cod_local_destino,' +
          ' :quantidade )';
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASql);
    ParamByName('cod_produto').AsInteger := ACodigoProduto;
    ParamByName('cod_local_origem').AsInteger := ALocalOrigem;
    ParamByName('cod_local_destino').AsInteger := ALocalDestino;
    ParamByName('quantidade').AsFloat := AQuantidade;
    ExecSQL;
  end;
end;

procedure TDM.InserirProduto(ADescricao, ACodigoBarras: string);
  var ASql : string;
      ANext : Integer;
begin
  ASql := 'INSERT INTO PRODUTO (CODIGO, DESCRICAO, CODIGO_BARRAS) ' +
          'VALUES (:codigo, :descricao, :codigo_barras)';

  ANext := NextSeq('SEQ_PRODUTO');
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ASql);
    ParamByName('codigo').AsInteger := ANext;
    ParamByName('descricao').AsString := ADescricao;
    ParamByName('codigo_barras').AsString := ACodigoBarras;
    ExecSQL;
  end;
end;

function TDM.NextSeq(ASequence: string): Integer;
  var ASql : string;
begin
  with QryComum do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select GEN_ID('+ASequence+', 1) as SEQ from RDB$DATABASE');
    Open();
    Result := FieldByName('SEQ').AsInteger;
  end;
end;

end.
