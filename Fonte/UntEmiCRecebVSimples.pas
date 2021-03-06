unit UntEmiCRecebVSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrmEmiCRVSimples = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBoxdata: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edit_inicial: TEdit;
    cmb_dtInicial: TDateTimePicker;
    edit_final: TEdit;
    cmb_dtFinal: TDateTimePicker;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBoximprimir: TGroupBox;
    BitBtnimprimir: TBitBtn;
    GroupBoxcliente: TGroupBox;
    Label6: TLabel;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ComboBox1: TComboBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    GroupBoxqtdedias: TGroupBox;
    Label14: TLabel;
    Editquantdias: TEdit;
    procedure BitBtnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edit_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_inicialEnter(Sender: TObject);
    procedure cmb_dtInicialEnter(Sender: TObject);
    procedure cmb_dtFinalChange(Sender: TObject);
    procedure cmb_dtInicialChange(Sender: TObject);
    procedure carregaclientecombo;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure edit_finalEnter(Sender: TObject);
    procedure edit_finalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditquantdiasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmiCRVSimples: TFrmEmiCRVSimples;

implementation

uses DmModuloRelatorioI, UntMenuPrincipal, DmModuloI;

{$R *.dfm}

procedure TFrmEmiCRVSimples.BitBtnimprimirClick(Sender: TObject);
begin
  if ((RadioButton1.Checked = True) or (RadioButton2.Checked = True) or
      (RadioButton4.Checked = True))then
  begin
    if (ComboBox1.Text = '') then
    begin
      ShowMessage('Nome cliente em branco.');
      ComboBox1.SetFocus;
      abort;
    end;
  end
  else begin
    if (ComboBox1.Text = '') then
    begin
      //aten�ao usei between para imprimir geral quando o combobox1 for branco ***
      FrmMenuPrincipal.nomeiniwk := '';
      FrmMenuPrincipal.nomefinwk := 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ';
    end;
  end;

  if (ComboBox1.Text <> '') then
  begin
    FrmMenuPrincipal.nomeiniwk := ComboBox1.Text;
    FrmMenuPrincipal.nomefinwk := ComboBox1.Text;
  end;

  if ({(RadioButton1.Checked = True) or }(RadioButton3.Checked = True){ or
      (RadioButton4.Checked = True) or (RadioButton5.Checked = True) or
      (RadioButton6.Checked = True)})then
  begin
    if (edit_inicial.Text = '') then
    begin
      ShowMessage('Data Inicial em branco.');
      edit_inicial.SetFocus;
      abort;
    end;
    if (RadioButton3.Checked = True) then //recibo pagamento
    begin
      edit_final.Text := edit_inicial.Text;
    end;
    if (edit_final.Text = '') then
    begin
      ShowMessage('Data Final em branco.');
      edit_final.SetFocus;
      abort;
    end;
    if (edit_inicial.Text > edit_final.Text) then
    begin
      ShowMessage('Data Final menor Data Fnicial.');
      edit_inicial.SetFocus;
      abort;
    end;
  end;

  if (RadioButton1.Checked = true) then  //demonstrativo debito
  begin
    DmModuleRelatorioI.CdsEmiDemonstDeb.close;
    DmModuleRelatorioI.CdsEmiDemonstDeb.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiDemonstDeb.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
    DmModuleRelatorioI.CdsEmiDemonstDeb.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiDemonstDeb.Params.ParamByName('nomefin').Value :=
         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiDemonstDeb.open;
    DmModuleRelatorioI.CdsEmiDemonstDeb.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptDemonstrativoDebito');
  end;
  if (RadioButton2.Checked = true) then  //recibo pagamento
  begin
    DmModuleRelatorioI.CdsEmiRecPagto.close;
    DmModuleRelatorioI.CdsEmiRecPagto.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiRecPagto.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
    DmModuleRelatorioI.CdsEmiRecPagto.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiRecPagto.open;
    DmModuleRelatorioI.CdsEmiRecPagto.RecordCount;
//    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
//    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptRecPagto');
  end;
  if (RadioButton4.Checked = true) then  //ficha financeira cliente
  begin
    DmModuleRelatorioI.CdsEmifichafinancli.close;
    DmModuleRelatorioI.CdsEmifichafinancli.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmifichafinancli.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
    DmModuleRelatorioI.CdsEmifichafinancli.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmifichafinancli.open;
    DmModuleRelatorioI.CdsEmifichafinancli.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptFichafincli');
  end;
  if (RadioButton5.Checked = true) then  //notas fiscais em aberto
  begin
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.close;
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.Params.ParamByName('nomefin').Value :=
         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.open;
    DmModuleRelatorioI.CdsEmiNfiscalemaberto.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptNfiscaisemaberto');
  end;
  if (RadioButton6.Checked = true) then  //notas fiscais pagas
  begin
    DmModuleRelatorioI.CdsEmiNfiscalpagas.close;
    DmModuleRelatorioI.CdsEmiNfiscalpagas.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiNfiscalpagas.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
    DmModuleRelatorioI.CdsEmiNfiscalpagas.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiNfiscalpagas.Params.ParamByName('nomefin').Value :=
         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiNfiscalpagas.open;
    DmModuleRelatorioI.CdsEmiNfiscalpagas.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptNfiscaispagas');
  end;
  if (RadioButton7.Checked = true) then  //notas fiscais vencidas x dias
  begin
    DmModuleRelatorioI.CdsEmiNfvencxdias.close;
    DmModuleRelatorioI.CdsEmiNfvencxdias.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiNfvencxdias.Params.ParamByName('nomefin').Value :=
         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiNfvencxdias.Params.ParamByName('diasvencidos').Value :=
         strtoint(Editquantdias.Text);
    DmModuleRelatorioI.CdsEmiNfvencxdias.open;
    DmModuleRelatorioI.CdsEmiNfvencxdias.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdiasvencido',Editquantdias.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptNfiscalvencidaxdias');
  end;
  if (RadioButton8.Checked = true) then  //notas fiscais vencidas x dias sintetizado
  begin
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.close;
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.Params.ParamByName('nomeini').Value :=
         FrmMenuPrincipal.nomeiniwk;
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.Params.ParamByName('nomefin').Value :=
         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.Params.ParamByName('diasvencidos').Value :=
         strtoint(Editquantdias.Text);
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.open;
    DmModuleRelatorioI.CdsEmiNfvencxdiassint.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdiasvencido',Editquantdias.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptNfiscalvencidaxdiassint');
  end;
end;

procedure TFrmEmiCRVSimples.FormShow(Sender: TObject);
begin
  carregaclientecombo;
end;

procedure TFrmEmiCRVSimples.edit_inicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmEmiCRVSimples.edit_inicialEnter(Sender: TObject);
begin
  cmb_dtFinal.Date := date;
  cmb_dtInicial.Date := date;
end;

procedure TFrmEmiCRVSimples.cmb_dtInicialEnter(Sender: TObject);
begin
  cmb_dtFinal.Date := date;
  cmb_dtInicial.Date := date;
end;

procedure TFrmEmiCRVSimples.cmb_dtFinalChange(Sender: TObject);
begin
  edit_final.Text := DateToStr(cmb_dtFinal.date)
end;

procedure TFrmEmiCRVSimples.cmb_dtInicialChange(Sender: TObject);
begin
  edit_inicial.Text := DateToStr(cmb_dtInicial.date);
end;

procedure TFrmEmiCRVSimples.carregaclientecombo;
var
  lista : AnsiString;
  flag : boolean;
begin
   lista := '';
   flag := True;

   DmModuleI.Cdspesqcliente.close;
   DmModuleI.Cdspesqcliente.Open;
   DmModuleI.Cdspesqcliente.RecordCount;
   while DmModuleI.Cdspesqcliente.eof = false do begin
      if flag then begin
         lista := lista +  DmModuleI.CdspesqclienteNOME.AsString;
         flag := False;
      end
      else begin
         lista := lista + #13 + DmModuleI.CdspesqclienteNOME.AsString;
      end;
      DmModuleI.Cdspesqcliente.Next;
   end;
   ComboBox1.Clear;
   ComboBox1.Items.Text := lista;
   ComboBox1.Visible := True;
end;

procedure TFrmEmiCRVSimples.RadioButton1Click(Sender: TObject);
begin
  GroupBoxdata.Visible := true;
  GroupBoxqtdedias.Visible := false;
  label1.Caption := 'Data Inicial';
  Label2.Caption := 'Per�odo:';
  label3.Visible := true;
  label4.Visible := true;
  edit_final.Visible := true;
  cmb_dtFinal.Visible := true;
end;

procedure TFrmEmiCRVSimples.RadioButton3Click(Sender: TObject);
begin
  ShowMessage('Em desenvolvimento!!!');
  GroupBoxdata.Visible := False;
  GroupBoxqtdedias.Visible := True;
end;

procedure TFrmEmiCRVSimples.RadioButton2Click(Sender: TObject);
begin
  GroupBoxdata.Visible := true;
  GroupBoxqtdedias.Visible := false;
  label1.Caption := 'Data Pagamento';
  Label2.Caption := 'Digite:';
  label3.Visible := false;
  label4.Visible := false;
  edit_final.Visible := false;
  cmb_dtFinal.Visible := false;
end;

procedure TFrmEmiCRVSimples.RadioButton4Click(Sender: TObject);
begin
  GroupBoxdata.Visible := true;
  GroupBoxqtdedias.Visible := false;
  label1.Caption := 'Data Inicial';
  Label2.Caption := 'Per�odo:';
  label3.Visible := true;
  label4.Visible := true;
  edit_final.Visible := true;
  cmb_dtFinal.Visible := true;
end;

procedure TFrmEmiCRVSimples.RadioButton5Click(Sender: TObject);
begin
  GroupBoxdata.Visible := true;
  GroupBoxqtdedias.Visible := false;
  label1.Caption := 'Data Inicial';
  Label2.Caption := 'Per�odo:';
  label3.Visible := true;
  label4.Visible := true;
  edit_final.Visible := true;
  cmb_dtFinal.Visible := true;
end;

procedure TFrmEmiCRVSimples.RadioButton6Click(Sender: TObject);
begin
  GroupBoxdata.Visible := true;
  GroupBoxqtdedias.Visible := false;
  label1.Caption := 'Data Inicial';
  Label2.Caption := 'Per�odo:';
  label3.Visible := true;
  label4.Visible := true;
  edit_final.Visible := true;
  cmb_dtFinal.Visible := true;  
end;

procedure TFrmEmiCRVSimples.RadioButton7Click(Sender: TObject);
begin
  GroupBoxdata.Visible := False;
  GroupBoxqtdedias.Visible := True;
end;

procedure TFrmEmiCRVSimples.RadioButton8Click(Sender: TObject);
begin
  GroupBoxdata.Visible := False;
  GroupBoxqtdedias.Visible := True;
end;

procedure TFrmEmiCRVSimples.edit_finalEnter(Sender: TObject);
begin
  if (edit_final.Text = '') then
  begin
     edit_final.Text := edit_inicial.text;
  end;
end;

procedure TFrmEmiCRVSimples.edit_finalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then BitBtnimprimir.SetFocus; //Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmEmiCRVSimples.ComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmEmiCRVSimples.EditquantdiasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

end.
