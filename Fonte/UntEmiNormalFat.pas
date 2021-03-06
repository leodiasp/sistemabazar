unit UntEmiNormalFat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrmEmiNormalFat = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
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
    procedure edit_inicialEnter(Sender: TObject);
    procedure edit_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_dtInicialChange(Sender: TObject);
    procedure cmb_dtInicialEnter(Sender: TObject);
    procedure cmb_dtFinalChange(Sender: TObject);
    procedure BitBtnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmiNormalFat: TFrmEmiNormalFat;

implementation

uses DmModuloRelatorioI, UntMenuPrincipal;

{$R *.dfm}

procedure TFrmEmiNormalFat.edit_inicialEnter(Sender: TObject);
begin
  cmb_dtFinal.Date := date;
  cmb_dtInicial.Date := date;
end;

procedure TFrmEmiNormalFat.edit_inicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmEmiNormalFat.cmb_dtInicialChange(Sender: TObject);
begin
  edit_inicial.Text := DateToStr(cmb_dtInicial.date);
end;

procedure TFrmEmiNormalFat.cmb_dtInicialEnter(Sender: TObject);
begin
  cmb_dtFinal.Date := date;
  cmb_dtInicial.Date := date;
end;

procedure TFrmEmiNormalFat.cmb_dtFinalChange(Sender: TObject);
begin
  edit_final.Text := DateToStr(cmb_dtFinal.date)
end;

procedure TFrmEmiNormalFat.BitBtnimprimirClick(Sender: TObject);
begin
  if (edit_inicial.Text = '') then
  begin
    ShowMessage('Data Inicial em branco.');
    edit_inicial.SetFocus;
    abort;
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

  if (RadioButton1.Checked = true) then  //balanco mensal
  begin
    DmModuleRelatorioI.CdsEmiBalancomensal.close;
    DmModuleRelatorioI.CdsEmiBalancomensal.Params.ParamByName('dtinicial').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiBalancomensal.Params.ParamByName('dtfinal').Value := StrToDate(edit_final.Text);
//    DmModuleRelatorioI.CdsEmiFatdiario.Params.ParamByName('nomeini').Value :=
//         FrmMenuPrincipal.nomeiniwk;
//    DmModuleRelatorioI.CdsEmiFatdiario.Params.ParamByName('nomefin').Value :=
//         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiBalancomensal.open;
    DmModuleRelatorioI.CdsEmiBalancomensal.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptBalancomensal');
  end;
  if (RadioButton2.Checked = true) then  //balanco anual
  begin
    DmModuleRelatorioI.CdsEmiBalancoanual.close;
    DmModuleRelatorioI.CdsEmiBalancoanual.Params.ParamByName('dataini').Value := StrToDate(edit_inicial.Text);
    DmModuleRelatorioI.CdsEmiBalancoanual.Params.ParamByName('datafin').Value := StrToDate(edit_final.Text);
//    DmModuleRelatorioI.CdsEmiFatdiario.Params.ParamByName('nomeini').Value :=
//         FrmMenuPrincipal.nomeiniwk;
//    DmModuleRelatorioI.CdsEmiFatdiario.Params.ParamByName('nomefin').Value :=
//         FrmMenuPrincipal.nomefinwk;
    DmModuleRelatorioI.CdsEmiBalancoanual.open;
    DmModuleRelatorioI.CdsEmiBalancoanual.RecordCount;
    frmMenuPrincipal.RvProjBazar.SetParam('xdatainicio',edit_inicial.text);
    frmMenuPrincipal.RvProjBazar.SetParam('xdatafim',edit_final.text);
    FrmMenuprincipal.RvProjBazar.ExecuteReport('RptBalancoanual');
  end;

end;

end.
