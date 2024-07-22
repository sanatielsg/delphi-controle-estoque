object DM: TDM
  OldCreateOrder = False
  Height = 387
  Width = 494
  object Con: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Database=C:\database\ESTOQUE.FDB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 80
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Firebird-2.5.9.27139-0_Win32\bin\fbclient.dll'
    Left = 88
    Top = 152
  end
  object QryComum: TFDQuery
    Connection = Con
    Left = 152
    Top = 248
  end
  object QryProdutos: TFDQuery
    Connection = Con
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 256
    Top = 152
    object QryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object QryProdutosCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      Size = 14
    end
  end
  object DSProdutos: TDataSource
    DataSet = QryProdutos
    Left = 288
    Top = 216
  end
  object QryLocais: TFDQuery
    Connection = Con
    SQL.Strings = (
      'SELECT * FROM LOCAL')
    Left = 392
    Top = 176
    object QryLocaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLocaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSLocais: TDataSource
    DataSet = QryLocais
    Left = 400
    Top = 256
  end
  object QryMovimentosEstoque: TFDQuery
    Connection = Con
    SQL.Strings = (
      'SELECT'
      'A.*,'
      'B.descricao AS NOME_PRODUTO,'
      'C.descricao AS NOME_LOCAL_ORIGEM,'
      'D.descricao AS NOME_LOCAL_DESTINO'
      'FROM MOVIMENTO_PRODUTO A'
      ' LEFT JOIN PRODUTO  B ON A.cod_produto = B.codigo'
      ' LEFT JOIN LOCAL C ON A.cod_local_origem = C.codigo'
      ' LEFT JOIN LOCAL D ON A.cod_local_destino = D.codigo')
    Left = 296
    Top = 16
    object QryMovimentosEstoqueCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryMovimentosEstoqueCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Required = True
    end
    object QryMovimentosEstoqueTIPO_MOVIMENTO: TIntegerField
      FieldName = 'TIPO_MOVIMENTO'
      Origin = 'TIPO_MOVIMENTO'
      Required = True
    end
    object QryMovimentosEstoqueCOD_LOCAL_ORIGEM: TIntegerField
      FieldName = 'COD_LOCAL_ORIGEM'
      Origin = 'COD_LOCAL_ORIGEM'
      Required = True
    end
    object QryMovimentosEstoqueCOD_LOCAL_DESTINO: TIntegerField
      FieldName = 'COD_LOCAL_DESTINO'
      Origin = 'COD_LOCAL_DESTINO'
      Required = True
    end
    object QryMovimentosEstoqueQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 3
    end
    object QryMovimentosEstoqueDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object QryMovimentosEstoqueNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryMovimentosEstoqueNOME_LOCAL_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_LOCAL_ORIGEM'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QryMovimentosEstoqueNOME_LOCAL_DESTINO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_LOCAL_DESTINO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object DSMovimentosEstoque: TDataSource
    DataSet = QryMovimentosEstoque
    Left = 312
    Top = 72
  end
end
