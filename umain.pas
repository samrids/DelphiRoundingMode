unit umain;

interface

uses Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  System.SysUtils,
  System.Variants,
  Vcl.dialogs,
  System.Math,
  Vcl.ComCtrls,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Controls,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxCalc,
  System.Classes;

type
  TForm1 = class(TForm)
    edExcVAT: TcxCalcEdit;
    edWHTAX: TcxCalcEdit;
    edNetAmount: TcxCalcEdit;
    edVAT: TcxCalcEdit;
    edNetPayment: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    Label8: TLabel;
    cmb_RoundMode: TComboBox;
    Edit1: TEdit;
    UpDownDigit: TUpDown;
    Button1: TButton;
    cxLabel1: TLabel;
    cxLabel2: TLabel;
    Lbl_DefaultRoundingMode: TLabel;
    lbComm: TLabel;
    cxLabel3: TLabel;
    cxLabel4: TLabel;
    cxLabel10: TLabel;
    cxLabel11: TLabel;
    btnVAT: TButton;
    btnWH: TButton;
    procedure btnVATClick(Sender: TObject);
    procedure edNetAmountEnter(Sender: TObject);
    procedure edNetPaymentEnter(Sender: TObject);
    procedure edExcVATExit(Sender: TObject);
    procedure btnWHClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_RoundModeChange(Sender: TObject);
    procedure UpDownDigitChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    OldRM: TRoundingMode;
    Digit: Byte;
  public
    A, B, C, D, E: Currency;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function AwRoundTo(const AValue: Extended; const ADigit: TRoundToRange)
  : Extended;
var
  LFactor: Extended;
begin
  LFactor := IntPower(10, (ADigit * (-1)));
  Result := Trunc((AValue / LFactor) + 0.5) * LFactor;
end;

procedure TForm1.btnVATClick(Sender: TObject);
begin
  B := A * 0.07;
  if cmb_RoundMode.ItemIndex = 4 then
    B := AwRoundTo(A * 0.07, UpDownDigit.Position);
  edVAT.Value := B
end;

procedure TForm1.btnWHClick(Sender: TObject);
begin
  D := A * 0.01;
  if cmb_RoundMode.ItemIndex = 4 then
    D := AwRoundTo(A * 0.01, UpDownDigit.Position);
  edWHTAX.Value := D;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  showmessage('Delphi Rounding mode.'#13#10 +
    '-------------------------------------------------------' + #13#10 +
    'Value                    Meaning' + #13#10 +
    '-------------------------------------------------------' + #13#10 +
    'rmNearest          Rounds to the closest value. (Default)' + #13#10 +
    'rmDown             Rounds toward negative infinity.' + #13#10 +
    'rmUp                  Rounds toward positive infinity.' + #13#10 +
    'rmTruncate       Truncates the value, rounding positive numbers down and negative numbers up.');
end;

procedure TForm1.edExcVATExit(Sender: TObject);
begin
  A := edExcVAT.Value;
end;

procedure TForm1.edNetAmountEnter(Sender: TObject);
begin
  C := A + B;
  if cmb_RoundMode.ItemIndex = 4 then
    C := AwRoundTo(A + B, UpDownDigit.Position);
  edNetAmount.Value := C;
end;

procedure TForm1.edNetPaymentEnter(Sender: TObject);
begin
  E := C - D;
  if cmb_RoundMode.ItemIndex = 4 then
    E := AwRoundTo(C - D, UpDownDigit.Position);
  edNetPayment.Value := E;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRoundMode(OldRM); // Restore to default
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Default variables
  Digit := UpDownDigit.Position;
  edExcVAT.Value := 11291.50;
  A := 11291.50;

  // Init...
  OldRM := GetRoundMode; { Save the original setting for the Round Mode }
  case OldRM of
    rmNearest:
      begin
        cmb_RoundMode.ItemIndex := 0;
        Lbl_DefaultRoundingMode.Caption :=
          'Default system rounding mode: rmNearest.';
      end;
    rmDown:
      begin
        cmb_RoundMode.ItemIndex := 1;
        Lbl_DefaultRoundingMode.Caption :=
          'Default system rounding mode: rmDown.';
      end;
    rmUp:
      begin
        cmb_RoundMode.ItemIndex := 2;
        Lbl_DefaultRoundingMode.Caption :=
          'Default system rounding mode: rmUp.';
      end;
    rmTruncate:
      begin
        cmb_RoundMode.ItemIndex := 3;
        Lbl_DefaultRoundingMode.Caption :=
          'Default system rounding mode: rmTruncate.';
      end;
  end;

  btnVATClick(nil);
  edNetAmountEnter(nil);
  btnWHClick(nil);
  edNetPaymentEnter(nil);

  edExcVAT.Refresh;
  edVAT.Refresh;
  edNetAmount.Refresh;
  edWHTAX.Refresh;
end;

procedure TForm1.UpDownDigitChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
var
  i: Byte;
  ADisPlayFormat: string;
begin
  btnVATClick(nil);
  edNetAmountEnter(nil);
  btnWHClick(nil);
  edNetPaymentEnter(nil);

  edExcVAT.Refresh;
  edVAT.Refresh;
  edNetAmount.Refresh;
  edWHTAX.Refresh;

  // Display floating-point 0..6 Digit
  ADisPlayFormat := '';
  Digit := NewValue;

  for i := 1 to NewValue do
    ADisPlayFormat := ADisPlayFormat + '0';

  ADisPlayFormat := ',0.' + ADisPlayFormat;

  edNetPayment.Properties.DisplayFormat := ADisPlayFormat;
  edVAT.Properties.DisplayFormat := ADisPlayFormat;
  edNetAmount.Properties.DisplayFormat := ADisPlayFormat;
  edWHTAX.Properties.DisplayFormat := ADisPlayFormat;
  edExcVAT.Properties.DisplayFormat := ADisPlayFormat;
end;

procedure TForm1.cmb_RoundModeChange(Sender: TObject);
begin
  case cmb_RoundMode.ItemIndex of
    0:
      SetRoundMode(rmNearest);
    1:
      SetRoundMode(rmDown);
    2:
      SetRoundMode(rmUp);
    3:
      SetRoundMode(rmTruncate);
    4: // Custome by Dev
      begin

      end;
  end;
  btnVATClick(nil);
  edNetAmountEnter(nil);
  btnWHClick(nil);
  edNetPaymentEnter(nil);

  edExcVAT.Refresh;
  edVAT.Refresh;
  edNetAmount.Refresh;
  edWHTAX.Refresh;
end;

end.
