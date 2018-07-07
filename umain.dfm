object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Test Currency'
  ClientHeight = 422
  ClientWidth = 950
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 384
    Top = 90
    Width = 10
    Height = 18
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 384
    Top = 130
    Width = 92
    Height = 18
    Caption = 'B = A x 0.07'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 384
    Top = 171
    Width = 26
    Height = 18
    Caption = 'C ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 384
    Top = 211
    Width = 93
    Height = 18
    Caption = 'D = A x 0.01'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 384
    Top = 252
    Width = 25
    Height = 18
    Caption = 'E ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 416
    Top = 171
    Width = 40
    Height = 18
    Caption = 'A + B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 416
    Top = 252
    Width = 35
    Height = 18
    Caption = 'C - D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 386
    Width = 287
    Height = 18
    Caption = #3585#3635#3627#3609#3604' '#3605#3633#3623#3649#3611#3619' A, B, C, D, E '#3648#3611#3655#3609' currency'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxLabel1: TLabel
    Left = 9
    Top = 17
    Width = 113
    Height = 21
    AutoSize = False
    Caption = 'Rounding mode:'
    Transparent = True
  end
  object cxLabel2: TLabel
    Left = 184
    Top = 44
    Width = 127
    Height = 24
    AutoSize = False
    Caption = 'Digit display format:'
    Transparent = True
  end
  object Lbl_DefaultRoundingMode: TLabel
    Left = 128
    Top = 17
    Width = 94
    Height = 16
    Caption = 'Rounding mode:'
    Transparent = True
  end
  object lbComm: TLabel
    Left = 16
    Top = 90
    Width = 130
    Height = 17
    AutoSize = False
    Caption = 'Exclude VAT Amount :'
    Transparent = True
  end
  object cxLabel3: TLabel
    Left = 16
    Top = 211
    Width = 117
    Height = 17
    AutoSize = False
    Caption = 'Withholding TAX :'
    Transparent = True
  end
  object cxLabel4: TLabel
    Left = 16
    Top = 171
    Width = 117
    Height = 17
    AutoSize = False
    Caption = 'Grand Total :'
    Transparent = True
  end
  object cxLabel10: TLabel
    Left = 16
    Top = 132
    Width = 117
    Height = 17
    AutoSize = False
    Caption = 'VAT Amount :'
    Transparent = True
  end
  object cxLabel11: TLabel
    Left = 16
    Top = 252
    Width = 117
    Height = 17
    AutoSize = False
    Caption = 'NET Payment :'
    Transparent = True
  end
  object edExcVAT: TcxCalcEdit
    Left = 158
    Top = 90
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Properties.Precision = 15
    TabOrder = 0
    OnExit = edExcVATExit
    Width = 220
  end
  object edWHTAX: TcxCalcEdit
    Left = 158
    Top = 211
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Properties.Precision = 15
    TabOrder = 1
    Width = 220
  end
  object edNetAmount: TcxCalcEdit
    Left = 158
    Top = 171
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Properties.Precision = 15
    TabOrder = 2
    OnEnter = edNetAmountEnter
    Width = 220
  end
  object edVAT: TcxCalcEdit
    Left = 158
    Top = 131
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Properties.Precision = 15
    TabOrder = 3
    Width = 220
  end
  object edNetPayment: TcxCalcEdit
    Left = 158
    Top = 252
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Properties.Precision = 15
    TabOrder = 4
    OnEnter = edNetPaymentEnter
    Width = 220
  end
  object Memo1: TMemo
    Left = 482
    Top = 69
    Width = 448
    Height = 335
    Color = clBtnFace
    Lines.Strings = (
      #3651#3626#3656' A = 11,291.50'
      ''
      #3585#3604#3611#3640#3656#3617' 7% ->  11,291.50 x 0.07 = 790.41 <- '#3588#3656#3634#3607#3637#3656#3606#3641#3585#3605#3657#3629#3591
      ''
      '* '#3649#3605#3656#3650#3611#3619#3649#3585#3619#3617#3650#3594#3623#3660' 790.40 '#3605#3634#3617#3650#3611#3619#3649#3585#3619#3617#3609#3637#3657' B = 790.40'
      ''
      'Grand Total  C = A + B ( 11,291.50 + 790.40 )'
      '    '#3605#3657#3629#3591#3652#3604#3657#3588#3656#3634'     = 12,081.90 '
      '* '#3649#3605#3656#3650#3611#3619#3649#3585#3619#3617#3650#3594#3623#3660' 12,081.91'
      ''
      
        #3585#3604#3611#3640#3656#3617' 1% ->  11,291.50 x 0.01 = 112.92 <- '#3588#3656#3634#3607#3637#3656#3606#3641#3585#3605#3657#3629#3591' '#3588#3619#3633#3657#3591#3609#3637 +
        #3657#3611#3633#3604#3606#3641#3585
      ''
      'NET Pay       E = C - D (12,081.91 - 112.92)'
      '                       = 11,968.99 <- '#3588#3656#3634#3606#3641#3585#3605#3657#3629#3591
      ''
      
        #3611#3633#3597#3627#3634#3588#3639#3629' '#3607#3635#3652#3617#3605#3629#3609' '#3585#3604' 7% '#3588#3639#3629' 11,291.50 x 0.07 = 790.405 '#3607#3635#3652#3617#3652#3617#3656#3611#3633#3604 +
        #3586#3638#3657#3609#3648#3611#3655#3609' '
      '790.41 '
      
        #3649#3605#3656' '#3605#3629#3609#3585#3604' 1% '#3588#3639#3629' 11,291.50 x 0.01 = 112.915 '#3606#3638#3591#3611#3633#3604#3586#3638#3657#3609#3648#3611#3655#3609' 112.9' +
        '2')
    ReadOnly = True
    TabOrder = 7
  end
  object cmb_RoundMode: TComboBox
    Left = 8
    Top = 44
    Width = 170
    Height = 24
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 8
    Text = 'rmNearest'
    OnChange = cmb_RoundModeChange
    Items.Strings = (
      'rmNearest'
      'rmDown'
      'rmUp'
      'rmTruncate'
      'Custom (force rounding)')
  end
  object Edit1: TEdit
    Left = 317
    Top = 43
    Width = 45
    Height = 24
    TabOrder = 9
    Text = '2'
  end
  object UpDownDigit: TUpDown
    Left = 362
    Top = 43
    Width = 16
    Height = 24
    Associate = Edit1
    Max = 6
    Position = 2
    TabOrder = 10
    OnChangingEx = UpDownDigitChangingEx
  end
  object Button1: TButton
    Left = 855
    Top = 38
    Width = 75
    Height = 25
    Caption = '?'
    TabOrder = 11
    OnClick = Button1Click
  end
  object btnVAT: TButton
    Left = 131
    Top = 131
    Width = 25
    Height = 21
    Hint = 'Refresh'
    Caption = '7%'
    TabOrder = 5
    OnClick = btnVATClick
  end
  object btnWH: TButton
    Left = 131
    Top = 211
    Width = 25
    Height = 21
    Hint = 'Refresh'
    Caption = '1%'
    TabOrder = 6
    OnClick = btnWHClick
  end
end
