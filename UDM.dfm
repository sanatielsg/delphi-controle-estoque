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
end
