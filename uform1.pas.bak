unit uform1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, uchecksum, uform2, uform3, uform4;

type

  { TPrufsummen }

  TPrufsummen = class(TForm)
    btIBAN: TButton;
    btGTIN: TButton;
    btIMEI: TButton;
    btISBN: TButton;
    procedure btGTINClick(Sender: TObject);
    procedure btIBANClick(Sender: TObject);
    procedure btIMEIClick(Sender: TObject);
    procedure btISBNClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Prufsummen: TPrufsummen;

implementation

{$R *.lfm}

{ TPrufsummen }

procedure TPrufsummen.btIBANClick(Sender: TObject);
begin
  IBANCalc.Visible := True;
end;

procedure TPrufsummen.btIMEIClick(Sender: TObject);
begin
  IMEICalc.Visible := True;
end;

procedure TPrufsummen.btISBNClick(Sender: TObject);
begin
  GTINCalc.Visible := True;
end;

procedure TPrufsummen.btGTINClick(Sender: TObject);
begin
  GTINCalc.Visible := True;
end;

end.
