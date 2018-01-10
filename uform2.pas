unit uform2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, uchecksum;

type

  { TIBANCalc }

  TIBANCalc = class(TForm)
    btCreate: TButton;
    btCheck: TButton;
    cbCountryCode: TComboBox;
    edAN: TEdit;
    edBC: TEdit;
    edIBAN: TEdit;
    lbCountryCode: TLabel;
    lbAccountNumber: TLabel;
    lbBankCode: TLabel;
    lbIBAN: TLabel;
    lbTrue: TLabel;
    lbFalse: TLabel;
    procedure btCheckClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
  private
    { private declarations }
    IBAN: TIBAN;
  public
    { public declarations }
  end;

var
  IBANCalc: TIBANCalc;

implementation

{$R *.lfm}

{ TIBANCalc }

procedure TIBANCalc.btCreateClick(Sender: TObject);
begin
  edIBAN.Text := IBAN.createIBAN(cbCountryCode.Text, edAN.Text, edBC.Text);
end;

procedure TIBANCalc.btCheckClick(Sender: TObject);
begin

  lbFalse.Visible := not IBAN.checkIBAN(edIBAN.Text);
  lbTrue.Visible := IBAN.checkIBAN(edIBAN.Text);
  //DE58100100100653899109
end;

end.
