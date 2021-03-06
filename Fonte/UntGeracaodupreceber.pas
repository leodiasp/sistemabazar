unit UntGeracaodupreceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntPadrao, DB, StdCtrls, Buttons, ExtCtrls, FMTBcd, SqlExpr,
  Grids, DBGrids;

type
  TFrmGeracaoDupreceber = class(TFrmPadrao)
    GroupBox1: TGroupBox;
    Sqlquerygeraduprec: TSQLQuery;
    DBGrid1: TDBGrid;
    Sqlquerydeletaduprec: TSQLQuery;
    SqlquerygeraduprecCODIGO: TIntegerField;
    SqlquerygeraduprecVALORTOTALNFISCAL: TFMTBCDField;
    SqlquerygeraduprecVALORENTRADA: TFMTBCDField;
    SqlquerygeraduprecDATAEMISSAO: TDateField;
    SqlquerygeraduprecNUMPARCELAS: TIntegerField;
    SqlquerygeraduprecFATOR: TFMTBCDField;
    SqlquerygeraduprecVLPARCELA: TFMTBCDField;
    Sqlqueryverifsetemduppagas: TSQLQuery;
    SqlqueryverifsetemduppagasCODIGO: TIntegerField;
    SqlqueryverifsetemduppagasNUMPRESTACAO: TIntegerField;
    SqlqueryverifsetemduppagasDATABAIXA: TDateField;
    procedure FormShow(Sender: TObject);
    procedure geradupreceber;
    procedure apagadupreceber;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeracaoDupreceber: TFrmGeracaoDupreceber;

implementation

uses DmModuloI, UntMenuPrincipal;

{$R *.dfm}

procedure TFrmGeracaoDupreceber.FormShow(Sender: TObject);
begin
  inherited;
  DmModuleI.Cdsduprec.Close;
  DmModuleI.Cdsduprec.Params.ParamByName('codigo').value :=
      DmModuleI.CdsNFvendamesCODIGO.Value;
  DmModuleI.Cdsduprec.open;
  if ((FrmMenuPrincipal.idprocessamento = 'Gerarduplicata') or
      (FrmMenuPrincipal.idprocessamento = 'Vendaduplicata')) then
  begin
    FrmGeracaoDupreceber.Sqlqueryverifsetemduppagas.Close;
    FrmGeracaoDupreceber.Sqlqueryverifsetemduppagas.Params.ParamByName('codigo').Value :=
             DmModuleI.CdsNFvendadetCODIGO.value;
    FrmGeracaoDupreceber.Sqlqueryverifsetemduppagas.Open;
    if (FrmGeracaoDupreceber.SqlqueryverifsetemduppagasCODIGO.Value > 0) then
    begin
      Application.MessageBox('Existe duplicatas j� pagas para esta venda!!!','Aten��o',+MB_OK+MB_ICONWARNING);
      Abort;
    end;
    DBGrid1.Enabled := true;
    apagadupreceber;
    geradupreceber;
  end;
  if FrmMenuPrincipal.idprocessamento = 'Verduplicata' then
  begin
    DBGrid1.Enabled := false;
  end;
end;

procedure TFrmGeracaoDupreceber.apagadupreceber;
begin
  DmModuleI.Cdsduprec.close;
  Sqlquerydeletaduprec.Params.ParamByName('codigo').value :=
       DmModuleI.CdsNFvendamesCODIGO.Value;
  DmModuleI.Cdsduprec.Open;
  Sqlquerydeletaduprec.ExecSQL();
  DmModuleI.Cdsduprec.close;
  DmModuleI.Cdsduprec.Open;
end;

procedure TFrmGeracaoDupreceber.geradupreceber;
var
  quantparcelaswk    : integer;
  valortotalwk : real;
begin
  valortotalwk := 0;
  quantparcelaswk := 0;
  FrmGeracaoDupreceber.Sqlquerygeraduprec.Close;
  FrmGeracaoDupreceber.Sqlquerygeraduprec.Params.ParamByName('codigo').Value :=
             DmModuleI.CdsNFvendadetCODIGO.value;
  FrmGeracaoDupreceber.Sqlquerygeraduprec.Open;
  DmModuleI.CdsNFvendames.RecordCount;
  quantparcelaswk := quantparcelaswk + 1;
  //gravar entrada *****
  if FrmGeracaoDupreceber.SqlquerygeraduprecVALORENTRADA.AsFloat > 0 then
  begin
    DmModuleI.Cdsduprec.Append;
    DmModuleI.CdsduprecCODIGO.Value :=
         FrmGeracaoDupreceber.SqlquerygeraduprecCODIGO.value;
    DmModuleI.CdsduprecNUMPRESTACAO.value := 0;
    DmModuleI.CdsduprecNUMPARCIAL.value := 0;
    DmModuleI.CdsduprecVALORPRESTACAO.Value :=
         FrmGeracaoDupreceber.SqlquerygeraduprecVALORENTRADA.Value;
    DmModuleI.CdsduprecDATAVENCTO.Value :=
         FrmGeracaoDupreceber.SqlquerygeraduprecDATAEMISSAO.value;
    DmModuleI.CdsduprecDATABAIXA.value :=
         FrmGeracaoDupreceber.SqlquerygeraduprecDATAEMISSAO.value;
    valortotalwk := FrmGeracaoDupreceber.SqlquerygeraduprecVALORENTRADA.AsFloat;
    DmModuleI.Cdsduprec.Post;
    DmModuleI.Cdsduprec.ApplyUpdates(0);
  end;
  
  //gravar presta��es ****
  while quantparcelaswk <=
             FrmGeracaoDupreceber.SqlquerygeraduprecNUMPARCELAS.Value do
  begin
    DmModuleI.Cdsduprec.Append;
    DmModuleI.CdsduprecCODIGO.Value :=
         FrmGeracaoDupreceber.SqlquerygeraduprecCODIGO.value;
    DmModuleI.CdsduprecNUMPRESTACAO.value := quantparcelaswk;
    DmModuleI.CdsduprecNUMPARCIAL.value := 0;
    valortotalwk := (valortotalwk +
           FrmGeracaoDupreceber.SqlquerygeraduprecVLPARCELA.AsFloat);

    //verifica se total parcela diferente total nota menos entrada***
    if quantparcelaswk =
             FrmGeracaoDupreceber.SqlquerygeraduprecNUMPARCELAS.Value then
    begin
      DmModuleI.Cdsduprecdifparcelas_e_totalnf.AsFloat :=
        (FrmGeracaoDupreceber.SqlquerygeraduprecVALORTOTALNFISCAL.AsFloat -
              valortotalwk);
      DmModuleI.CdsduprecVALORPRESTACAO.AsFloat :=
           FrmGeracaoDupreceber.SqlquerygeraduprecVLPARCELA.AsFloat +
           DmModuleI.Cdsduprecdifparcelas_e_totalnf.AsFloat;
      DmModuleI.Cdsduprecdifparcelas_e_totalnf.AsFloat := 0;
    end
    else begin
      DmModuleI.CdsduprecVALORPRESTACAO.AsFloat :=
         FrmGeracaoDupreceber.SqlquerygeraduprecVLPARCELA.AsFloat;
    end;
    DmModuleI.Cdsduprec.Post;
    DmModuleI.Cdsduprec.ApplyUpdates(0);
    quantparcelaswk := quantparcelaswk + 1;
  end;
  DmModuleI.Cdsduprec.Close;
  DmModuleI.Cdsduprec.Params.ParamByName('codigo').value :=
      DmModuleI.CdsNFvendamesCODIGO.Value;
  DmModuleI.Cdsduprec.open;  
end;

end.
