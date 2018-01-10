unit uform4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, uchecksum;

type

  { TIMEICalc }

  TIMEICalc = class(TForm)
    btCreateChecksum: TButton;
    btCheck: TButton;
    edIMEI: TEdit;
    edIMEIC: TEdit;
    lbFalse: TLabel;
    lbIMEI: TLabel;
    lbIMEIC: TLabel;
    lbTrue: TLabel;
    procedure btCreateChecksumClick(Sender: TObject);
    procedure btCheckClick(Sender: TObject);
  private
    { private declarations }
    IMEI: TIMEI;
  public
    { public declarations }
  end;

var
  IMEICalc: TIMEICalc;

implementation

{$R *.lfm}

{ TIMEICalc }

procedure TIMEICalc.btCreateChecksumClick(Sender: TObject);
begin
  edIMEIC.Text := IMEI.createIMEI(edIMEI.Text);
end;

procedure TIMEICalc.btCheckClick(Sender: TObject);
begin
  lbTrue.Visible := IMEI.checkIMEI(edIMEIC.Text);
  lbFalse.Visible := not IMEI.checkIMEI(edIMEIC.Text);
end;

end.

