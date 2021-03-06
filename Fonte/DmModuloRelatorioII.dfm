object DmModuleRelatorioII: TDmModuleRelatorioII
  OldCreateOrder = False
  Left = 65532
  Top = 65532
  Height = 736
  Width = 1032
  object SqldsEmiFFinanduprec: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select spgffdr.*'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bai' +
      'rro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from sp_ge' +
      'ra_fichafinancduprec (:nomeini) spgffdr'#13#10'inner join empresa e on' +
      ' e.codempresa = 1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 8
  end
  object DspEmiFFinanduprec: TDataSetProvider
    DataSet = SqldsEmiFFinanduprec
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 8
  end
  object CdsEmiFFinanduprec: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiFFinanduprec'
    Left = 360
    Top = 8
    object CdsEmiFFinanduprecCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CdsEmiFFinanduprecNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
    end
    object CdsEmiFFinanduprecDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object CdsEmiFFinanduprecDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmiFFinanduprecDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiFFinanduprecDATABAIXA: TDateField
      FieldName = 'DATABAIXA'
    end
    object CdsEmiFFinanduprecVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecVLJUROSOUDESCONTOS: TFMTBCDField
      FieldName = 'VLJUROSOUDESCONTOS'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecVALORTOTALPAGO: TFMTBCDField
      FieldName = 'VALORTOTALPAGO'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object CdsEmiFFinanduprecNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 50
    end
    object CdsEmiFFinanduprecVALORVENCIDO: TFMTBCDField
      FieldName = 'VALORVENCIDO'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecVALORAVENCER: TFMTBCDField
      FieldName = 'VALORAVENCER'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecVALORTOTALDEVEDOR: TFMTBCDField
      FieldName = 'VALORTOTALDEVEDOR'
      Precision = 15
      Size = 2
    end
    object CdsEmiFFinanduprecNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiFFinanduprecTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiFFinanduprecENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiFFinanduprecNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiFFinanduprecBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiFFinanduprecCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiFFinanduprecCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiFFinanduprecEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiFFinanduprecCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiFFinanduprecINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiFFinanduprecUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmiFFinanduprec: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiFFinanduprec
    Left = 479
    Top = 8
  end
  object SqldsEmiDuprecabertoanalitico: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dr.codigo'#13#10',nfm.codigoflex30'#13#10',dr.numprestacao'#13#10',dr.datav' +
      'encto'#13#10',extract (month from dr.datavencto) as mesvencto'#13#10',extrac' +
      't (year from dr.datavencto) as anovencto'#13#10',extract (year from dr' +
      '.datavencto)||'#13#10' extract (month from dr.datavencto) as anomesven' +
      'cto'#13#10',dr.valorprestacao'#13#10',c.codigo as codcliente'#13#10',c.nome as nom' +
      'ecli'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade' +
      ',e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicatasreceber' +
      ' dr'#13#10'inner join notafiscalvendames nfm on dr.codigo = nfm.codigo' +
      #13#10'inner join cliente c on nfm.codcliente = c.codigo'#13#10'inner join ' +
      'empresa e on e.codempresa = 1'#13#10'where ((dr.datavencto between :dt' +
      'inicial and :dtfinal)'#13#10'and (dr.databaixa is null))'#13#10'order by 4,3' +
      ',c.nome'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 64
    Top = 56
  end
  object DspEmiDuprecabertoanalitico: TDataSetProvider
    DataSet = SqldsEmiDuprecabertoanalitico
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 214
    Top = 56
  end
  object CdsEmiDuprecabertoanalitico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecabertoanalitico'
    Left = 360
    Top = 56
    object CdsEmiDuprecabertoanaliticoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEmiDuprecabertoanaliticoCODIGOFLEX30: TIntegerField
      FieldName = 'CODIGOFLEX30'
    end
    object CdsEmiDuprecabertoanaliticoDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiDuprecabertoanaliticoMESVENCTO: TSmallintField
      FieldName = 'MESVENCTO'
    end
    object CdsEmiDuprecabertoanaliticoANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecabertoanaliticoVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecabertoanaliticoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object CdsEmiDuprecabertoanaliticoNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 50
    end
    object CdsEmiDuprecabertoanaliticoANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecabertoanaliticoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecabertoanaliticoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecabertoanaliticoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecabertoanaliticoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecabertoanaliticoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecabertoanaliticoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecabertoanaliticoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecabertoanaliticoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecabertoanaliticoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecabertoanaliticoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecabertoanaliticoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsEmiDuprecabertoanaliticoNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
      Required = True
    end
  end
  object RvdsEmiDuprecabertoanalitico: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecabertoanalitico
    Left = 511
    Top = 56
  end
  object SqldsEmiDuprecabertosintetico: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select'#13#10'case'#13#10'  when extract(month from dr.datavencto) =  1 then' +
      ' '#39'Janeiro'#39#13#10'  when extract(month from dr.datavencto) =  2 then '#39 +
      'Fevereiro'#39#13#10'  when extract(month from dr.datavencto) =  3 then '#39 +
      'Mar'#231'o'#39#13#10'  when extract(month from dr.datavencto) =  4 then '#39'Abri' +
      'l'#39#13#10'  when extract(month from dr.datavencto) =  5 then '#39'Maio'#39#13#10' ' +
      ' when extract(month from dr.datavencto) =  6 then '#39'Junho'#39#13#10'  whe' +
      'n extract(month from dr.datavencto) =  7 then '#39'Julho'#39#13#10'  when ex' +
      'tract(month from dr.datavencto) =  8 then '#39'Agosto'#39#13#10'  when extra' +
      'ct(month from dr.datavencto) =  9 then '#39'Setembro'#39#13#10'  when extrac' +
      't(month from dr.datavencto) = 10 then '#39'Outubro'#39#13#10'  when extract(' +
      'month from dr.datavencto) = 11 then '#39'Novembro'#39#13#10'  when extract(m' +
      'onth from dr.datavencto) = 12 then '#39'Dezembro'#39#13#10'end mesvencto'#13#10',e' +
      'xtract(year from dr.datavencto) as anovencto'#13#10',extract(year from' +
      ' dr.datavencto)||extract(month from dr.datavencto) as anomesvenc' +
      'to'#13#10',sum(dr.valorprestacao) as totalvlprestacaomes'#13#10',e.nome,e.te' +
      'lefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.email'#13#10',e' +
      '.cnpj,e.inscricao,e.uf'#13#10'from duplicatasreceber dr'#13#10'inner join em' +
      'presa e on e.codempresa = 1'#13#10'where ((dr.datavencto between :dtin' +
      'icial and :dtfinal)'#13#10'and (dr.databaixa is null))'#13#10'group by extra' +
      'ct(year from dr.datavencto)||extract(month from dr.datavencto)'#13#10 +
      ',extract(month from dr.datavencto)'#13#10',extract(year from dr.datave' +
      'ncto)'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidad' +
      'e,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 104
  end
  object DspEmiDuprecabertosintetico: TDataSetProvider
    DataSet = SqldsEmiDuprecabertosintetico
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 104
  end
  object CdsEmiDuprecabertosintetico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecabertosintetico'
    Left = 384
    Top = 104
    object CdsEmiDuprecabertosinteticoANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecabertosinteticoMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
    object CdsEmiDuprecabertosinteticoANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecabertosinteticoTOTALVLPRESTACAOMES: TFMTBCDField
      FieldName = 'TOTALVLPRESTACAOMES'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecabertosinteticoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecabertosinteticoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecabertosinteticoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecabertosinteticoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecabertosinteticoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecabertosinteticoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecabertosinteticoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecabertosinteticoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecabertosinteticoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecabertosinteticoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecabertosinteticoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvdsEmiDuprecabertosintetico: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecabertosintetico
    Left = 543
    Top = 104
  end
  object SqldsEmiDuprecvenccli: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dr.codigo'#13#10',nfm.codigoflex30'#13#10',dr.numprestacao'#13#10',nfm.data' +
      'emissao'#13#10',dr.datavencto'#13#10',dr.valorprestacao'#13#10',(current_date - dr' +
      '.datavencto) as diasvencidos'#13#10',c.codigo as codcliente'#13#10',c.nome a' +
      's nomecli'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.c' +
      'idade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicatasre' +
      'ceber dr'#13#10'inner join notafiscalvendames nfm on dr.codigo = nfm.c' +
      'odigo'#13#10'inner join cliente c on nfm.codcliente = c.codigo'#13#10'inner ' +
      'join empresa e on e.codempresa = 1'#13#10'where ((dr.datavencto betwee' +
      'n :dtinicial and :dtfinal)'#13#10'and (dr.databaixa is null)'#13#10'and (c.n' +
      'ome between :nomeini and :nomefin)'#13#10'and (dr.datavencto <= curren' +
      't_date))'#13#10'order by c.nome,dr.codigo,dr.numprestacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 56
    Top = 152
  end
  object DspEmiDuprecvenccli: TDataSetProvider
    DataSet = SqldsEmiDuprecvenccli
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 174
    Top = 152
  end
  object CdsEmiDuprecvenccli: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecvenccli'
    Left = 288
    Top = 152
    object CdsEmiDuprecvenccliCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEmiDuprecvenccliCODIGOFLEX30: TIntegerField
      FieldName = 'CODIGOFLEX30'
    end
    object CdsEmiDuprecvenccliNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
      Required = True
    end
    object CdsEmiDuprecvenccliDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmiDuprecvenccliDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiDuprecvenccliVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecvenccliDIASVENCIDOS: TIntegerField
      FieldName = 'DIASVENCIDOS'
    end
    object CdsEmiDuprecvenccliCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object CdsEmiDuprecvenccliNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 50
    end
    object CdsEmiDuprecvenccliNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecvenccliTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecvenccliENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecvenccliNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecvenccliBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecvenccliCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecvenccliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecvenccliEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecvenccliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecvenccliINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecvenccliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmiDuprecvenccli: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecvenccli
    Left = 407
    Top = 152
  end
  object RvDsEmiDuprecvenmensalanalit: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecvenmensalanalit
    Left = 543
    Top = 200
  end
  object SqldsEmiDuprecvenmensalanalit: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select'#13#10'case'#13#10'  when extract(month from dr.datavencto) =  1 then' +
      ' '#39'Janeiro'#39#13#10'  when extract(month from dr.datavencto) =  2 then '#39 +
      'Fevereiro'#39#13#10'  when extract(month from dr.datavencto) =  3 then '#39 +
      'Mar'#231'o'#39#13#10'  when extract(month from dr.datavencto) =  4 then '#39'Abri' +
      'l'#39#13#10'  when extract(month from dr.datavencto) =  5 then '#39'Maio'#39#13#10' ' +
      ' when extract(month from dr.datavencto) =  6 then '#39'Junho'#39#13#10'  whe' +
      'n extract(month from dr.datavencto) =  7 then '#39'Julho'#39#13#10'  when ex' +
      'tract(month from dr.datavencto) =  8 then '#39'Agosto'#39#13#10'  when extra' +
      'ct(month from dr.datavencto) =  9 then '#39'Setembro'#39#13#10'  when extrac' +
      't(month from dr.datavencto) = 10 then '#39'Outubro'#39#13#10'  when extract(' +
      'month from dr.datavencto) = 11 then '#39'Novembro'#39#13#10'  when extract(m' +
      'onth from dr.datavencto) = 12 then '#39'Dezembro'#39#13#10'end mesvencto'#13#10',e' +
      'xtract (year from dr.datavencto) as anovencto'#13#10',extract (year fr' +
      'om dr.datavencto)||'#13#10' extract (month from dr.datavencto) as anom' +
      'esvencto'#13#10',dr.codigo'#13#10',nfm.codigoflex30'#13#10',dr.numprestacao'#13#10',nfm.' +
      'dataemissao'#13#10',dr.datavencto'#13#10',dr.valorprestacao'#13#10',(current_date ' +
      '- dr.datavencto) as diasvencidos'#13#10',c.codigo as codcliente'#13#10',c.no' +
      'me as nomecli'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro' +
      ',e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicat' +
      'asreceber dr'#13#10'inner join notafiscalvendames nfm on dr.codigo = n' +
      'fm.codigo'#13#10'inner join cliente c on nfm.codcliente = c.codigo'#13#10'in' +
      'ner join empresa e on e.codempresa = 1'#13#10'where ((dr.datavencto be' +
      'tween :dtinicial and :dtfinal)'#13#10'and (dr.databaixa is null)'#13#10'and ' +
      '(dr.datavencto <= current_date))'#13#10'order by 3,c.nome,dr.codigo,dr' +
      '.numprestacao'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 200
  end
  object DspEmiDuprecvenmensalanalit: TDataSetProvider
    DataSet = SqldsEmiDuprecvenmensalanalit
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 200
  end
  object CdsEmiDuprecvenmensalanalit: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecvenmensalanalit'
    Left = 384
    Top = 200
    object CdsEmiDuprecvenmensalanalitMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
    object CdsEmiDuprecvenmensalanalitANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecvenmensalanalitANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecvenmensalanalitCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEmiDuprecvenmensalanalitCODIGOFLEX30: TIntegerField
      FieldName = 'CODIGOFLEX30'
    end
    object CdsEmiDuprecvenmensalanalitNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
      Required = True
    end
    object CdsEmiDuprecvenmensalanalitDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmiDuprecvenmensalanalitDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiDuprecvenmensalanalitVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecvenmensalanalitDIASVENCIDOS: TIntegerField
      FieldName = 'DIASVENCIDOS'
    end
    object CdsEmiDuprecvenmensalanalitCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object CdsEmiDuprecvenmensalanalitNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 50
    end
    object CdsEmiDuprecvenmensalanalitNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecvenmensalanalitTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecvenmensalanalitENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecvenmensalanalitNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecvenmensalanalitBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecvenmensalanalitCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecvenmensalanalitCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecvenmensalanalitEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecvenmensalanalitCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecvenmensalanalitINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecvenmensalanalitUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object SqldsEmiDuprecvenmensalsint: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select'#13#10'case'#13#10'  when extract(month from dr.datavencto) =  1 then' +
      ' '#39'Janeiro'#39#13#10'  when extract(month from dr.datavencto) =  2 then '#39 +
      'Fevereiro'#39#13#10'  when extract(month from dr.datavencto) =  3 then '#39 +
      'Mar'#231'o'#39#13#10'  when extract(month from dr.datavencto) =  4 then '#39'Abri' +
      'l'#39#13#10'  when extract(month from dr.datavencto) =  5 then '#39'Maio'#39#13#10' ' +
      ' when extract(month from dr.datavencto) =  6 then '#39'Junho'#39#13#10'  whe' +
      'n extract(month from dr.datavencto) =  7 then '#39'Julho'#39#13#10'  when ex' +
      'tract(month from dr.datavencto) =  8 then '#39'Agosto'#39#13#10'  when extra' +
      'ct(month from dr.datavencto) =  9 then '#39'Setembro'#39#13#10'  when extrac' +
      't(month from dr.datavencto) = 10 then '#39'Outubro'#39#13#10'  when extract(' +
      'month from dr.datavencto) = 11 then '#39'Novembro'#39#13#10'  when extract(m' +
      'onth from dr.datavencto) = 12 then '#39'Dezembro'#39#13#10'end mesvencto'#13#10',e' +
      'xtract (year from dr.datavencto) as anovencto'#13#10',extract (year fr' +
      'om dr.datavencto)||'#13#10' extract (month from dr.datavencto) as anom' +
      'esvencto'#13#10',sum(dr.valorprestacao) as totalvlprestacaomes'#13#10',e.nom' +
      'e,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.ema' +
      'il'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicatasreceber dr'#13#10'inner j' +
      'oin notafiscalvendames nfm on dr.codigo = nfm.codigo'#13#10'inner join' +
      ' cliente c on nfm.codcliente = c.codigo'#13#10'inner join empresa e on' +
      ' e.codempresa = 1'#13#10'where ((dr.datavencto between :dtinicial and ' +
      ':dtfinal)'#13#10'and (dr.databaixa is null)'#13#10'and (dr.datavencto <= cur' +
      'rent_date))'#13#10'group by extract(year from dr.datavencto)||extract(' +
      'month from dr.datavencto)'#13#10',extract(month from dr.datavencto)'#13#10',' +
      'extract(year from dr.datavencto)'#13#10',e.nome,e.telefone,e.endereco,' +
      'e.numero'#13#10',e.bairro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,' +
      'e.uf'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 248
  end
  object DspEmiDuprecvenmensalsint: TDataSetProvider
    DataSet = SqldsEmiDuprecvenmensalsint
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 248
  end
  object CdsEmiDuprecvenmensalsint: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecvenmensalsint'
    Left = 384
    Top = 248
    object CdsEmiDuprecvenmensalsintMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
    object CdsEmiDuprecvenmensalsintANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecvenmensalsintANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecvenmensalsintTOTALVLPRESTACAOMES: TFMTBCDField
      FieldName = 'TOTALVLPRESTACAOMES'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecvenmensalsintNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecvenmensalsintTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecvenmensalsintENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecvenmensalsintNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecvenmensalsintBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecvenmensalsintCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecvenmensalsintCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecvenmensalsintEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecvenmensalsintCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecvenmensalsintINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecvenmensalsintUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmiDuprecvenmensalsint: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecvenmensalsint
    Left = 543
    Top = 248
  end
  object RvDsEmiDuprecpagasanalit: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecpagasanalit
    Left = 543
    Top = 296
  end
  object RvDsEmiDuprecpagassint: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiDuprecpagassint
    Left = 543
    Top = 344
  end
  object SqldsEmiDuprecpagasanalit: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dr.codigo'#13#10',nfm.codigoflex30'#13#10',dr.numprestacao'#13#10',nfm.data' +
      'emissao'#13#10',dr.datavencto'#13#10',dr.databaixa,'#13#10'case'#13#10'  when extract(mo' +
      'nth from dr.databaixa) =  1 then '#39'Janeiro'#39#13#10'  when extract(month' +
      ' from dr.databaixa) =  2 then '#39'Fevereiro'#39#13#10'  when extract(month ' +
      'from dr.databaixa) =  3 then '#39'Mar'#231'o'#39#13#10'  when extract(month from ' +
      'dr.databaixa) =  4 then '#39'Abril'#39#13#10'  when extract(month from dr.da' +
      'tabaixa) =  5 then '#39'Maio'#39#13#10'  when extract(month from dr.databaix' +
      'a) =  6 then '#39'Junho'#39#13#10'  when extract(month from dr.databaixa) = ' +
      ' 7 then '#39'Julho'#39#13#10'  when extract(month from dr.databaixa) =  8 th' +
      'en '#39'Agosto'#39#13#10'  when extract(month from dr.databaixa) =  9 then '#39 +
      'Setembro'#39#13#10'  when extract(month from dr.databaixa) = 10 then '#39'Ou' +
      'tubro'#39#13#10'  when extract(month from dr.databaixa) = 11 then '#39'Novem' +
      'bro'#39#13#10'  when extract(month from dr.databaixa) = 12 then '#39'Dezembr' +
      'o'#39#13#10'end mesvencto'#13#10',extract (year from dr.databaixa) as anovenct' +
      'o'#13#10',extract (year from dr.databaixa)||'#13#10'extract (month from dr.d' +
      'atabaixa) as anomesvencto'#13#10',dr.valortotalpago'#13#10',c.codigo as codc' +
      'liente'#13#10',c.nome as nomecli'#13#10',e.nome,e.telefone,e.endereco,e.nume' +
      'ro'#13#10',e.bairro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10 +
      'from duplicatasreceber dr'#13#10'inner join notafiscalvendames nfm on ' +
      'dr.codigo = nfm.codigo'#13#10'inner join cliente c on nfm.codcliente =' +
      ' c.codigo'#13#10'inner join empresa e on e.codempresa = 1'#13#10'where (dr.d' +
      'atabaixa between :dtinicial and :dtfinal)'#13#10'order by dr.databaixa' +
      ',dr.datavencto,dr.codigo,dr.numprestacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 296
  end
  object SqldsEmiDuprecpagassint: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dr.databaixa,'#13#10'case'#13#10'  when extract(month from dr.databai' +
      'xa) =  1 then '#39'Janeiro'#39#13#10'  when extract(month from dr.databaixa)' +
      ' =  2 then '#39'Fevereiro'#39#13#10'  when extract(month from dr.databaixa) ' +
      '=  3 then '#39'Mar'#231'o'#39#13#10'  when extract(month from dr.databaixa) =  4 ' +
      'then '#39'Abril'#39#13#10'  when extract(month from dr.databaixa) =  5 then ' +
      #39'Maio'#39#13#10'  when extract(month from dr.databaixa) =  6 then '#39'Junho' +
      #39#13#10'  when extract(month from dr.databaixa) =  7 then '#39'Julho'#39#13#10'  ' +
      'when extract(month from dr.databaixa) =  8 then '#39'Agosto'#39#13#10'  when' +
      ' extract(month from dr.databaixa) =  9 then '#39'Setembro'#39#13#10'  when e' +
      'xtract(month from dr.databaixa) = 10 then '#39'Outubro'#39#13#10'  when extr' +
      'act(month from dr.databaixa) = 11 then '#39'Novembro'#39#13#10'  when extrac' +
      't(month from dr.databaixa) = 12 then '#39'Dezembro'#39#13#10'end mesvencto'#13#10 +
      ',extract (year from dr.databaixa) as anovencto'#13#10',extract (year f' +
      'rom dr.databaixa)||'#13#10' extract (month from dr.databaixa) as anome' +
      'svencto'#13#10',sum(dr.valortotalpago) as totalvlpagomensal'#13#10',e.nome,e' +
      '.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.email'#13 +
      #10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicatasreceber dr'#13#10'inner join' +
      ' notafiscalvendames nfm on dr.codigo = nfm.codigo'#13#10'inner join cl' +
      'iente c on nfm.codcliente = c.codigo'#13#10'inner join empresa e on e.' +
      'codempresa = 1'#13#10'where (dr.databaixa between :dtinicial and :dtfi' +
      'nal)'#13#10'group by dr.databaixa'#13#10',extract (year from dr.databaixa)||' +
      'extract (month from dr.databaixa)'#13#10',extract (month from dr.datab' +
      'aixa)'#13#10',extract (year from dr.databaixa)'#13#10',e.nome,e.telefone,e.e' +
      'ndereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.in' +
      'scricao,e.uf'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 344
  end
  object DspEmiDuprecpagasanalit: TDataSetProvider
    DataSet = SqldsEmiDuprecpagasanalit
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 296
  end
  object DspEmiDuprecpagassint: TDataSetProvider
    DataSet = SqldsEmiDuprecpagassint
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 344
  end
  object CdsEmiDuprecpagasanalit: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecpagasanalit'
    Left = 384
    Top = 296
    object CdsEmiDuprecpagasanalitCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEmiDuprecpagasanalitCODIGOFLEX30: TIntegerField
      FieldName = 'CODIGOFLEX30'
    end
    object CdsEmiDuprecpagasanalitNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
      Required = True
    end
    object CdsEmiDuprecpagasanalitDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmiDuprecpagasanalitDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiDuprecpagasanalitDATABAIXA: TDateField
      FieldName = 'DATABAIXA'
    end
    object CdsEmiDuprecpagasanalitVALORTOTALPAGO: TFMTBCDField
      FieldName = 'VALORTOTALPAGO'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecpagasanalitCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object CdsEmiDuprecpagasanalitNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 50
    end
    object CdsEmiDuprecpagasanalitNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecpagasanalitTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecpagasanalitENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecpagasanalitNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecpagasanalitBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecpagasanalitCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecpagasanalitCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecpagasanalitEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecpagasanalitCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecpagasanalitINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecpagasanalitUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsEmiDuprecpagasanalitANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecpagasanalitANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecpagasanalitMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
  end
  object CdsEmiDuprecpagassint: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiDuprecpagassint'
    Left = 384
    Top = 344
    object CdsEmiDuprecpagassintDATABAIXA: TDateField
      FieldName = 'DATABAIXA'
    end
    object CdsEmiDuprecpagassintMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
    object CdsEmiDuprecpagassintANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmiDuprecpagassintANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmiDuprecpagassintTOTALVLPAGOMENSAL: TFMTBCDField
      FieldName = 'TOTALVLPAGOMENSAL'
      Precision = 15
      Size = 2
    end
    object CdsEmiDuprecpagassintNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiDuprecpagassintTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiDuprecpagassintENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiDuprecpagassintNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiDuprecpagassintBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiDuprecpagassintCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiDuprecpagassintCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiDuprecpagassintEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiDuprecpagassintCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiDuprecpagassintINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiDuprecpagassintUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object SqldsEminfentforn: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select nfem.codigo'#13#10',nfem.numnfiscal'#13#10',nfem.codforn,f.nome as no' +
      'meforn,f.telefone01'#13#10',nfem.dataemissao,nfem.dataentrada'#13#10',i.nome' +
      ' as nomeitem'#13#10',nfed.qtde,nfed.vltotaproduto'#13#10',e.nome,e.telefone,' +
      'e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e' +
      '.inscricao,e.uf'#13#10'from notafiscalentmes nfem'#13#10'inner join notafisc' +
      'alentdet nfed on nfem.codigo = nfed.codigo'#13#10'inner join fornecedo' +
      'r f on nfem.codforn = f.codforn'#13#10'inner join item i on nfed.cdite' +
      'm = i.cditem'#13#10'inner join empresa e on e.codempresa = 1'#13#10'where ((' +
      'nfem.dataemissao between :dtinicial and :dtfinal)'#13#10'and (f.nome b' +
      'etween :nomeini and :nomefin))'#13#10'order by nfem.codforn,nfem.datae' +
      'missao,nfem.codigo,nfed.cditem'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 392
  end
  object DspEminfentforn: TDataSetProvider
    DataSet = SqldsEminfentforn
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 230
    Top = 392
  end
  object CdsEminfentforn: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEminfentforn'
    Left = 384
    Top = 392
    object CdsEminfentfornCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEminfentfornCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object CdsEminfentfornNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEminfentfornDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEminfentfornDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object CdsEminfentfornNOMEITEM: TStringField
      FieldName = 'NOMEITEM'
      Required = True
      Size = 50
    end
    object CdsEminfentfornQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object CdsEminfentfornVLTOTAPRODUTO: TFMTBCDField
      FieldName = 'VLTOTAPRODUTO'
      Precision = 15
      Size = 2
    end
    object CdsEminfentfornNUMNFISCAL: TIntegerField
      FieldName = 'NUMNFISCAL'
    end
    object CdsEminfentfornTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEminfentfornNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEminfentfornTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEminfentfornENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEminfentfornNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEminfentfornBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEminfentfornCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEminfentfornCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEminfentfornEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEminfentfornCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEminfentfornINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEminfentfornUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEminfentforn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEminfentforn
    Left = 544
    Top = 392
  end
  object SqldsEminfentitem: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select nfem.codigo'#13#10',nfem.numnfiscal'#13#10',nfem.codforn,f.nome as no' +
      'meforn,f.telefone01'#13#10',nfem.dataemissao,nfem.dataentrada'#13#10',nfed.c' +
      'ditem,i.nome as nomeitem'#13#10',nfed.qtde,nfed.vltotaproduto'#13#10',e.nome' +
      ',e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.emai' +
      'l'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from notafiscalentmes nfem'#13#10'inner j' +
      'oin notafiscalentdet nfed on nfem.codigo = nfed.codigo'#13#10'inner jo' +
      'in fornecedor f on nfem.codforn = f.codforn'#13#10'inner join item i o' +
      'n nfed.cditem = i.cditem'#13#10'inner join empresa e on e.codempresa =' +
      ' 1'#13#10'where ((nfem.dataemissao between :dtinicial and :dtfinal)'#13#10'a' +
      'nd (i.nome between :nomeini and :nomefin))'#13#10'order by i.nome,nfem' +
      '.dataentrada,nfem.codigo'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 440
  end
  object DspEminfentitem: TDataSetProvider
    DataSet = SqldsEminfentitem
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 232
    Top = 440
  end
  object CdsEminfentitem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEminfentitem'
    Left = 384
    Top = 440
    object CdsEminfentitemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEminfentitemNUMNFISCAL: TIntegerField
      FieldName = 'NUMNFISCAL'
    end
    object CdsEminfentitemCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object CdsEminfentitemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEminfentitemTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEminfentitemDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEminfentitemDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object CdsEminfentitemCDITEM: TIntegerField
      FieldName = 'CDITEM'
      Required = True
    end
    object CdsEminfentitemNOMEITEM: TStringField
      FieldName = 'NOMEITEM'
      Required = True
      Size = 50
    end
    object CdsEminfentitemQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object CdsEminfentitemVLTOTAPRODUTO: TFMTBCDField
      FieldName = 'VLTOTAPRODUTO'
      Precision = 15
      Size = 2
    end
    object CdsEminfentitemNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEminfentitemTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEminfentitemENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEminfentitemNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEminfentitemBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEminfentitemCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEminfentitemCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEminfentitemEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEminfentitemCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEminfentitemINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEminfentitemUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEminfentitem: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEminfentitem
    Left = 544
    Top = 440
  end
  object SqldsEminfentperiodo: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select nfem.codigo'#13#10',nfem.numnfiscal'#13#10',nfem.codforn,f.nome as no' +
      'meforn,f.telefone01'#13#10',nfem.dataemissao,nfem.dataentrada'#13#10',nfed.c' +
      'ditem,i.nome as nomeitem'#13#10',nfed.qtde,nfed.vltotaproduto'#13#10',e.nome' +
      ',e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,e.emai' +
      'l'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from notafiscalentmes nfem'#13#10'inner j' +
      'oin notafiscalentdet nfed on nfem.codigo = nfed.codigo'#13#10'inner jo' +
      'in fornecedor f on nfem.codforn = f.codforn'#13#10'inner join item i o' +
      'n nfed.cditem = i.cditem'#13#10'inner join empresa e on e.codempresa =' +
      ' 1'#13#10'where ((nfem.dataentrada between :dtinicial and :dtfinal))'#13#10 +
      'order by nfem.dataentrada,nfem.codigo'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 488
  end
  object DspEminfentperiodo: TDataSetProvider
    DataSet = SqldsEminfentperiodo
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 232
    Top = 488
  end
  object CdsEminfentperiodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end>
    ProviderName = 'DspEminfentperiodo'
    Left = 384
    Top = 488
    object CdsEminfentperiodoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsEminfentperiodoNUMNFISCAL: TIntegerField
      FieldName = 'NUMNFISCAL'
    end
    object CdsEminfentperiodoCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object CdsEminfentperiodoNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEminfentperiodoTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEminfentperiodoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEminfentperiodoDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object CdsEminfentperiodoCDITEM: TIntegerField
      FieldName = 'CDITEM'
      Required = True
    end
    object CdsEminfentperiodoNOMEITEM: TStringField
      FieldName = 'NOMEITEM'
      Required = True
      Size = 50
    end
    object CdsEminfentperiodoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object CdsEminfentperiodoVLTOTAPRODUTO: TFMTBCDField
      FieldName = 'VLTOTAPRODUTO'
      Precision = 15
      Size = 2
    end
    object CdsEminfentperiodoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEminfentperiodoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEminfentperiodoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEminfentperiodoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEminfentperiodoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEminfentperiodoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEminfentperiodoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEminfentperiodoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEminfentperiodoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEminfentperiodoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEminfentperiodoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEminfentperiodo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEminfentperiodo
    Left = 544
    Top = 488
  end
  object SqldsEmiduppagas: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dp.datapagto'#13#10',dp.coddupapagar'#13#10',dp.codforn,f.nome as nom' +
      'eforn,f.telefone01'#13#10',dp.dataemissao,dp.datavencto'#13#10',dp.valorpres' +
      'tacao'#13#10',dp.obs'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairr' +
      'o,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplica' +
      'taspagar dp'#13#10'inner join fornecedor f on dp.codforn = f.codforn'#13#10 +
      'inner join empresa e on e.codempresa = 1'#13#10'where ((dp.datapagto b' +
      'etween :dtinicial and :dtfinal)'#13#10'and (f.nome between :nomeini an' +
      'd :nomefin))'#13#10'order by dp.datapagto,dp.codforn,dp.coddupapagar,d' +
      'p.numprestacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 72
    Top = 536
  end
  object DspEmiduppagas: TDataSetProvider
    DataSet = SqldsEmiduppagas
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 232
    Top = 536
  end
  object CdsEmiduppagas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiduppagas'
    Left = 384
    Top = 536
    object CdsEmiduppagasDATAPAGTO: TDateField
      FieldName = 'DATAPAGTO'
    end
    object CdsEmiduppagasCODDUPAPAGAR: TIntegerField
      FieldName = 'CODDUPAPAGAR'
      Required = True
    end
    object CdsEmiduppagasCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Required = True
    end
    object CdsEmiduppagasNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEmiduppagasTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEmiduppagasDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmiduppagasDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmiduppagasVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmiduppagasOBS: TStringField
      FieldName = 'OBS'
      Size = 40
    end
    object CdsEmiduppagasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmiduppagasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmiduppagasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmiduppagasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmiduppagasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmiduppagasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmiduppagasCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmiduppagasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmiduppagasCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmiduppagasINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmiduppagasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmiduppagas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiduppagas
    Left = 544
    Top = 536
  end
  object SqldsEmidupaberto: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select dp.coddupapagar'#13#10',dp.codforn,f.nome as nomeforn,f.telefon' +
      'e01'#13#10',dp.dataemissao,dp.datavencto'#13#10',dp.valorprestacao'#13#10',dp.obs'#13 +
      #10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.ce' +
      'p,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from duplicataspagar dp'#13#10'in' +
      'ner join fornecedor f on dp.codforn = f.codforn'#13#10'inner join empr' +
      'esa e on e.codempresa = 1'#13#10'where ((dp.datapagto is null)'#13#10'and (d' +
      'p.datavencto between :dtinicial and :dtfinal)'#13#10'and (f.nome betwe' +
      'en :nomeini and :nomefin))'#13#10'order by dp.datavencto,dp.codforn,dp' +
      '.coddupapagar,dp.numprestacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 592
    Top = 8
  end
  object DspEmidupaberto: TDataSetProvider
    DataSet = SqldsEmidupaberto
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 696
    Top = 8
  end
  object CdsEmidupaberto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmidupaberto'
    Left = 792
    Top = 8
    object CdsEmidupabertoCODDUPAPAGAR: TIntegerField
      FieldName = 'CODDUPAPAGAR'
      Required = True
    end
    object CdsEmidupabertoCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Required = True
    end
    object CdsEmidupabertoNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEmidupabertoTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEmidupabertoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmidupabertoDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmidupabertoVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmidupabertoOBS: TStringField
      FieldName = 'OBS'
      Size = 40
    end
    object CdsEmidupabertoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmidupabertoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmidupabertoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmidupabertoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmidupabertoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmidupabertoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmidupabertoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmidupabertoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmidupabertoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmidupabertoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmidupabertoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmidupaberto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmidupaberto
    Left = 895
    Top = 8
  end
  object SqldsEmidupabertomes: TSQLDataSet
    CommandText = 
      'select dp.coddupapagar'#13#10',dp.numprestacao'#13#10',dp.codforn,f.nome as ' +
      'nomeforn,f.telefone01'#13#10',dp.dataemissao,dp.datavencto'#13#10',dp.valorp' +
      'restacao,'#13#10'case'#13#10'  when extract(month from dp.datavencto) =  1 t' +
      'hen '#39'Janeiro'#39#13#10'  when extract(month from dp.datavencto) =  2 the' +
      'n '#39'Fevereiro'#39#13#10'  when extract(month from dp.datavencto) =  3 the' +
      'n '#39'Mar'#231'o'#39#13#10'  when extract(month from dp.datavencto) =  4 then '#39'A' +
      'bril'#39#13#10'  when extract(month from dp.datavencto) =  5 then '#39'Maio'#39 +
      #13#10'  when extract(month from dp.datavencto) =  6 then '#39'Junho'#39#13#10'  ' +
      'when extract(month from dp.datavencto) =  7 then '#39'Julho'#39#13#10'  when' +
      ' extract(month from dp.datavencto) =  8 then '#39'Agosto'#39#13#10'  when ex' +
      'tract(month from dp.datavencto) =  9 then '#39'Setembro'#39#13#10'  when ext' +
      'ract(month from dp.datavencto) = 10 then '#39'Outubro'#39#13#10'  when extra' +
      'ct(month from dp.datavencto) = 11 then '#39'Novembro'#39#13#10'  when extrac' +
      't(month from dp.datavencto) = 12 then '#39'Dezembro'#39#13#10'end mesvencto'#13 +
      #10',extract (year from dp.datavencto) as anovencto'#13#10',extract (year' +
      ' from dp.datavencto)||'#13#10' extract (month from dp.datavencto) as a' +
      'nomesvencto'#13#10',dp.obs'#13#10',e.nome,e.telefone,e.endereco,e.numero'#13#10',e' +
      '.bairro,e.cidade,e.cep,e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from d' +
      'uplicataspagar dp'#13#10'inner join fornecedor f on dp.codforn = f.cod' +
      'forn'#13#10'inner join empresa e on e.codempresa = 1'#13#10'where ((dp.datap' +
      'agto is null)'#13#10'and (dp.datavencto between :dtinicial and :dtfina' +
      'l)'#13#10'and (f.nome between :nomeini and :nomefin))'#13#10'order by dp.dat' +
      'avencto,dp.codforn,dp.coddupapagar,dp.numprestacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 544
    Top = 152
  end
  object DspEmidupabertomes: TDataSetProvider
    DataSet = SqldsEmidupabertomes
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 664
    Top = 152
  end
  object CdsEmidupabertomes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dtinicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dtfinal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmidupabertomes'
    Left = 776
    Top = 152
    object CdsEmidupabertomesCODDUPAPAGAR: TIntegerField
      FieldName = 'CODDUPAPAGAR'
      Required = True
    end
    object CdsEmidupabertomesCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Required = True
    end
    object CdsEmidupabertomesNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEmidupabertomesTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEmidupabertomesDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object CdsEmidupabertomesDATAVENCTO: TDateField
      FieldName = 'DATAVENCTO'
    end
    object CdsEmidupabertomesVALORPRESTACAO: TFMTBCDField
      FieldName = 'VALORPRESTACAO'
      Precision = 15
      Size = 2
    end
    object CdsEmidupabertomesMESVENCTO: TStringField
      FieldName = 'MESVENCTO'
      FixedChar = True
      Size = 9
    end
    object CdsEmidupabertomesANOVENCTO: TSmallintField
      FieldName = 'ANOVENCTO'
    end
    object CdsEmidupabertomesANOMESVENCTO: TStringField
      FieldName = 'ANOMESVENCTO'
      Size = 12
    end
    object CdsEmidupabertomesOBS: TStringField
      FieldName = 'OBS'
      Size = 40
    end
    object CdsEmidupabertomesNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmidupabertomesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmidupabertomesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmidupabertomesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmidupabertomesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmidupabertomesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmidupabertomesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmidupabertomesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmidupabertomesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmidupabertomesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmidupabertomesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsEmidupabertomesNUMPRESTACAO: TIntegerField
      FieldName = 'NUMPRESTACAO'
      Required = True
    end
  end
  object RvDsEmidupabertomes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmidupabertomes
    Left = 887
    Top = 152
  end
  object SqldsEmiforn: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select f.codforn,f.nome as nomeforn,f.telefone01,f.telefone02'#13#10',' +
      'e.nome,e.telefone,e.endereco,e.numero'#13#10',e.bairro,e.cidade,e.cep,' +
      'e.email'#13#10',e.cnpj,e.inscricao,e.uf'#13#10'from fornecedor f'#13#10'inner join' +
      ' empresa e on e.codempresa = 1'#13#10'where (f.nome between :nomeini a' +
      'nd :nomefin)'#13#10'order by f.nome'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    SQLConnection = FrmMenuPrincipal.SQLConnection1
    Left = 664
    Top = 216
  end
  object DspEmiforn: TDataSetProvider
    DataSet = SqldsEmiforn
    Options = [poAutoRefresh, poAllowCommandText]
    Left = 728
    Top = 216
  end
  object CdsEmiforn: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nomeini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nomefin'
        ParamType = ptInput
      end>
    ProviderName = 'DspEmiforn'
    Left = 792
    Top = 216
    object CdsEmifornCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Required = True
    end
    object CdsEmifornNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 50
    end
    object CdsEmifornNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsEmifornTELEFONE01: TStringField
      FieldName = 'TELEFONE01'
    end
    object CdsEmifornTELEFONE02: TStringField
      FieldName = 'TELEFONE02'
      Size = 40
    end
    object CdsEmifornTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object CdsEmifornENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsEmifornNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdsEmifornBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 31
    end
    object CdsEmifornCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsEmifornCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsEmifornEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsEmifornCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsEmifornINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 12
    end
    object CdsEmifornUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object RvDsEmiforn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdsEmiforn
    Left = 887
    Top = 216
  end
end
