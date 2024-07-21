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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conectar(ACaminhoBanco : string);
    procedure CriarEstrutura();
    procedure Execute(ASql : string);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }



{ TDM }

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
end;

procedure TDM.Execute(ASql: string);
begin
  with QryComum do
  begin
    SQL.Clear;
    SQL.Add(ASql);
    ExecSQL;
  end;
end;

end.
