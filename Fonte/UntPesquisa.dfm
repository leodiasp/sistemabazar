object FrmPesquisa: TFrmPesquisa
  Left = 78
  Top = 108
  Width = 904
  Height = 614
  Caption = 'Pesquisa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 498
    Top = 92
    Width = 23
    Height = 22
    Cursor = crHandPoint
    Hint = 'Executa Filtro'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 74
    Width = 489
    Height = 50
    Caption = 'Digite a descri'#231#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Edit1: TEdit
      Left = 8
      Top = 19
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
  end
  object Button2: TButton
    Left = 528
    Top = 80
    Width = 105
    Height = 39
    Cursor = crHandPoint
    Hint = 'Limpar Dados de Consulta'
    Caption = '&Limpar Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 546
    Width = 92
    Height = 30
    Caption = 'Ok'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      1A060000424D1A06000000000000DA0300002800000018000000180000000100
      08000000000040020000120B0000120B0000E9000000E900000000000000FFFF
      FF0025242700403F420069686B005C5B5D00777678006E697200FF00FF005A58
      59005957580059484900764E4E007E55550098696900A7747400AB777700A271
      7100A1707000AB787800A37272008C626200BB878700B9858500936A6A00BC88
      8800AA7B7B00A3767600A77B7B00C9959500C7939300CA969600B0838300D6A2
      A200D8A4A400D7A3A300D4A1A100D0A0A000E5B1B100E4B0B000E3AFAF00E2AE
      AE00E9B6B600E8B5B500F0BCBC00E7B5B500EFBCBC0067666600FDFCFC00D5D4
      D400754D4B00785250008F686600C6B5B300774E4800C7B6B200C7B4AF00C7B5
      B000E5D7D0009A969400A75A1900A06C43008F7B6A008E796700CB660000C965
      0000C6640000C5630000BA5E0000B95D0000A6530000A35200008B4600008A45
      0000753B0000B55C0100763E0900B37940008E796500FBEAD900F7E7D700FEEF
      E000FBF4ED00FEFBF800FEFCFA00FDFBF900FBF9F700D3D1CF00FEFDFC007F56
      2900FED7AB00FCD5AA00FDD6AB00E7C5A000EBCAA500EACAA600CFB49700FEF2
      E500FEF4E900FEF5EB00FEF6ED00E27E0300E07D0300DF821000F6D1A700E7C5
      9D00F7D2A800E7C59E00F8D4AB00CCAF8D00CCAF8E00CCB08F00AB947900D0B4
      9400D0B59600AB957B00AF998000B09B8200AE9A82009584700093847200FDF0
      E100FEF3E600FEF7EF00FEF8F100FBF6F000DC973D0082592400DF993E00DA95
      3D00CD8C3900B47C32009A6A2B0097682A0093847100FBEFE000FEFAF500FDF9
      F400FBF8F400FEF9F200F7F5F200FBF8F300F6F3EE00FDFBF7009CC19600A1C8
      9E000E6B09007DB17A008EBB8B00009600000089000000740000007300000071
      0000A6ECA70043BC470086DF8D0016A22D001DB43A0022452A0029C1540036C8
      610030C861002E8C4F0030795500629D84008E9D9D0000CCFF0000C2F50000BC
      EF0000B9EC0000B3E6002A4D560068868E0000A9DC00009ED100019CCF0007A1
      D1001594BD0000A3DC000A84B1000B749B000C82AF000D81AD00106A8E001253
      6E00175A7400225569001E4454002B424C002F6B88004A6B7F006F98B2004F62
      71003397F9003081D2002948690028415B0029415C00283A4E00297EE500424D
      5A00275186001E5FC80022417700223E6E000443BA005C6370001646AB001941
      93000130B100242730000732C2000833C2000C36C8001E47D800113CE4002B53
      EA00456AF8006D8AFD001A37CD00041CB1000316AC000515AC002538CC00293B
      CD00020EA5000E1BB80000009A0035353700F1F1F2009F9FA000FEFEFE000808
      080808E5E508080808080808080808080808080808080808080808E5E5BDBC08
      0808080808080808080808080808080808080808BBB6B8B90808080808080808
      080808080808404040404042ACB4B7BEC90B4C49474543414040404040084064
      6261514FA6B5BF1A19130D4E706D69685B5A5A5A4008408B7B637A7950BA1B22
      1F19100D3F706E6B685B5A5A40084053887C646287AD2026231D160F0C3F736F
      5D6A5B5A40084058909797979799342A26231D16143259858382815C400840E8
      93969EA19B9592182A27211D16110C3E74715E6C410840E8949DA29C9AA0983A
      152A27211D1611337775725F420840E8E89FA4C0A5A391523C152B28241E1712
      367F8460440840E8E7D3D1D0D1D33B894138152D28241E17120C8676460840E8
      05CCCBCBCBCD0A54407D391C2C29241E0ECFC178480840E803CAC8C8C8CA0958
      408F7E4D1C2E2907B1A9AAAF4A0840E803C7C3C2C2C52FE84058538D371C25B2
      A7A7AAD2E40840E8060202C6C40257E840E858558A3515ABA7B3D2DDDEE440E8
      E60402020431E8E840E88080807E3DAEA8CED8D6D4DE40E8E8E8E8E8E8E8E8E8
      40E8E8E8E830568EB0DCDAD7D5E240E8E8E8E8E8E8E8E8E840E8E8E8E8E83055
      8CE1DBD9DF084065656565656565656565656565656565656667E0E34B084040
      4040404040404040404040404040404040404143430808404040404040404040
      4040404040404040404040400808080808080808080808080808080808080808
      080808080808080808080808080808080808080808080808080808080808}
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 543
    Width = 92
    Height = 30
    Caption = '&Cancel'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      3E050000424D3E05000000000000FE0200002800000018000000180000000100
      08000000000040020000120B0000120B0000B2000000B200000000000000FFFF
      FF00FF00FF00FEFDFD00FDE2DE00F7827000E8614600FCBBAD00FCD3CB00EE66
      4800F97D5F00FA7F6000FA856800FCCCC100EB745400F9836100FA866400FB88
      6600E8A08800C9531E00BF4E140088452400DEB09A00D5A89000C8764600CB66
      0000FEEDDC00FEEEDE00FEEFE000FEF3E800FEF4EA00FEF5EC00FEF6EE00FEF7
      F000FEF9F400FEFBF800FEFCFA00FEFDFC00FED7AB00FEDCB700FEDDB800FEDF
      BD00FEE0BF00FEE1C100FEE2C300FEE3C500FEE4C700FEE4C800FEE6CC00FEEA
      D400FEEBD600FEECD800FEEDDA00FEEEDC00FEEEDD00FEF0E100FEF1E300FEF2
      E500FEF3E700FEF4E900FEF5EB00FEF6ED00E27E0300FEDFBB00FEE0BE00FEE1
      BF00FEE3C300FEE4C500FEE6CA00FEE7CC00FEE8CE00FEE8CF00FEE9D100FEEA
      D300FEEBD500FEEDD800FEEEDB00FEEFDE00FEF0DF00FEF1E200FEF3E600FEF4
      E800FEF5EA00FEF7EF00FEF8F100F6F0E900FEF9F300DF993E00FEEEDA00FEF2
      E300FEFAF500FEFBF700FEF6EB00FEF9F200FEFCF900FEFBF600FEFCF800FEFD
      FB00ECEDED002391C1002794C6002C95C40000669A001070A0002F93C4002F90
      C1003A92BC00408CB30080B3CD00CEE1EA000E75AC00137AB300247DAC00609F
      C000C9E1EE002188C5004CB4FC00CCE3F200EFF5F90049B0FC003FA6FB004BAB
      FA0088C8FD0070A1E1004071FA004274FF00497AFC00275AFF002C5FFF003664
      FA00386BFF00174AFD001A4CFF001B4DFF001D50FF002355FF002558FF002655
      FA002E5BF9002D59F400325DF1003B66F3000030FC000132FF000134FF000C3C
      FF00103DFB00103BF4001342FF001743F6001847FF001A48F9001A47F8001B46
      F6001D4BFF001C47F6001D48F6001D49F600214EFC00204BF800204CF800224D
      F800224CF400224DF1002550F400002CF800002DF800002CF600002AF300012D
      F600032BF2000431FE000733F600123BF100143EF400C4C5D40000009A00FEFE
      FE0002020202020202020202020202B0B0020202020202B0B002020202020202
      020202020202B08393B002020202B0A58EB0020202020202020202020202B098
      84ADB00202B0A98FA8B019191919191919191919191919B09B85AEB0B0A690AA
      B002193D3B391C1A3248452E19413F27B09C8692AB8FA7B01902195D533C504F
      364B494619432B2928B0979491ACB026190219235A543D51594E584A19452E2C
      40B09E9A9695B02619021925181515151515163519495757B08A80A19F8799B0
      190219B114090A0C0506153819344AB081828BB0B0A2889DB00219B1130F0B04
      080E151E1937B07C7D8CB02C2AB0A37FA0B019B1121007010D111721193AB07E
      8DB057575757B0A489B019B1B17B69686AAF555A193D3BB0B04C3248452F42B0
      B00219B17A787878787962241956533C504F1B4B3147442D190219B165777777
      77647503196057575757575757575730190219B16E747474746372B119255E5F
      5D20525037363349190219B1716E6F6F7370B1B119B125245B22211F1D594D34
      190219B1766C67666B6DB1B119B157575757575757575737190219B1B1B1B1B1
      B1B1B1B119B1B1B1B103245F56215C3A190219B1B1B1B1B1B1B1B1B119B1B1B1
      B1B103615E5A543D1902193E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
      1902191919191919191919191919191919191919191919191902021919191919
      1919191919191919191919191919191902020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202}
  end
  object GroupBoxClassificacao: TGroupBox
    Left = 8
    Top = 7
    Width = 336
    Height = 60
    Caption = 'Classifica'#231#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = GroupBoxClassificacaoClick
    object RadioButton1: TRadioButton
      Left = 8
      Top = 29
      Width = 73
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 94
      Top = 30
      Width = 113
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 206
      Top = 28
      Width = 113
      Height = 17
      Caption = 'Grupo Item'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 131
    Width = 884
    Height = 404
    TabOrder = 5
    object DBGrid1: TDBGrid
      Left = 6
      Top = 15
      Width = 868
      Height = 378
      Color = clInfoBk
      DataSource = DtSrc
      FixedColor = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyPress = DBGrid1KeyPress
    end
  end
  object DtSrc: TDataSource
    Left = 176
    Top = 224
  end
end