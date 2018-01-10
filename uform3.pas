unit uform3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, uchecksum;

type

  { TGTINCalc }

  TGTINCalc = class(TForm)
    btCreate: TButton;
    btCheck: TButton;
    edGTIN: TEdit;
    edGTINC: TEdit;
    lbFalse: TLabel;
    lbTrue: TLabel;
    lbGTINC: TLabel;
    lbGTIN: TLabel;
    procedure btCheckClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
  private
    { private declarations }
    GTIN: TGTIN;
  public
    { public declarations }
  end;

var
  GTINCalc: TGTINCalc;

implementation

{$R *.lfm}

{ TGTINCalc }

procedure TGTINCalc.btCreateClick(Sender: TObject);
begin
  edGTINC.Text := GTIN.createGTIN(edGTIN.Text);
end;

procedure TGTINCalc.btCheckClick(Sender: TObject);
begin
  lbFalse.Visible := not GTIN.checkGTIN(edGTINC.Text);
  lbTrue.Visible := GTIN.checkGTIN(edGTINC.Text);
end;

end.

