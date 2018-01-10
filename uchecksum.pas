unit uchecksum;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TChecksum = class
  private
  public
  end;


  { TIBAN }

  TIBAN = class(TChecksum)
  private

  public
    function calcIBAN(iban: string): integer;
    function createChecksum(iban: string): string;
    function checkIBAN(iban: string): boolean;
    function createIBAN(countrycode, accountnumber, bankcode: string): string;
  end;

  { TGTIN }

  TGTIN = class(TChecksum)
  private
  public
    function createGTIN(gtin: string): string;
    function checkGTIN(gtin: string): boolean;
    function createChecksum(gtin: string): string;
  end;

  { TIMEI }

  TIMEI = class(TChecksum)
  private
  public
    function createIMEI(imei: string): string;
    function checkIMEI(imei: string): boolean;
    function createChecksum(imei: string): string;
  end;

implementation

{ TIMEI }

function TIMEI.createIMEI(imei: string): string;
begin
  Result := imei + createChecksum(imei);
end;

function TIMEI.checkIMEI(imei: string): boolean;
begin
  Result := createChecksum(imei) = '0';
end;

function TIMEI.createChecksum(imei: string): string;
var
  curr, number, checksum, i, add: integer;

begin
  number := 0;
  for i := 1 to length(imei) do
  begin
    curr := StrToInt(imei[i]);
    //Wenn eine durch 2 teilbare Stelle erreicht ist, verdoppel die Zahl
    if i mod 2 = 0 then
    begin
      curr := curr * 2;
    end;
    //Wenn curr größer als 9 ist, bilde die Quersumme der Zahl und setze sie auf add
    if curr > 9 then
    begin
      add := 0;
      while (curr > 0) do
      begin
        add := add + curr mod 10;
        curr := curr div 10;
      end;
    end
    //Wenn nicht, dann setze add auf curr
    else
      add := curr;
    //Addiere add mit der number
    number := number + add;
  end;

  checksum := number mod 10;
  if checksum = 0 then
    Result := IntToStr(checksum)
  else
    Result := IntToStr(10 - checksum);
end;

{ TGTIN }

function TGTIN.createGTIN(gtin: string): string;
begin
  Result := gtin + createChecksum(gtin);
end;

function TGTIN.checkGTIN(gtin: string): boolean;
begin
  Result := StrToInt(createChecksum(gtin)) = 0;
end;

function TGTIN.createChecksum(gtin: string): string;
var
  i: integer;
  checksum: integer;
  product: string;
begin
  product := '1';
  for i := 2 to length(gtin) do
  begin
    if product[i - 1] = '1' then
      product[i] := '3'
    else
      product[i] := '1';
  end;

  checksum := 0;
  for i := 1 to length(gtin) do
    checksum := checksum + StrToInt(gtin[i]) * StrToInt(product[i]);

  checksum := checksum mod 10;
  if checksum > 0 then
    checksum := 10 - checksum;
  Result := IntToStr(checksum);
end;

{ TIBAN }

function TIBAN.calcIBAN(iban: string): integer;
var
  k, n, rest: integer;
  c: char;
begin
  n := length(iban);
  if (n < 5) or (n > 34) then
    exit;
  rest := 0;
  k := 5;
  repeat // Zeichen der IBAN in geänderter Reihenfolge per Modulo-97 prüfen
    c := iban[k];
    case c of
      '0'..'9': // Ziffer als solche berücksichtigen
        rest := (rest * 10 + Ord(c) - 48) mod 97;
      'A'..'Z': // 'A' wie '10', 'B' wie '11' usw.
        rest := (rest * 100 + Ord(c) - 55) mod 97
      else
        exit
    end;
    Inc(k);
    if k > n then
      k := 1
  until k = 5;
  Result := rest;
end;

function TIBAN.createChecksum(iban: string): string;
var
  checksum: string;
  rest: integer;
begin
  rest := calcIBAN(iban);
  //Prüfsumme formatieren, falls nur einstellig führende Null anhängen
  if length(IntToStr(98 - rest)) = 1 then
    checksum := '0' + IntToStr(98 - rest)
  else
    checksum := IntToStr(98 - rest);
  Result := checksum;
end;

function TIBAN.checkIBAN(iban: string): boolean;
var
  rest: integer;
begin
  rest := calcIBAN(iban);
  Result := rest = 1;
end;

function TIBAN.createIBAN(countrycode, accountnumber, bankcode: string): string;
var
  iban: string;
begin
  iban := countrycode + '00' + bankcode + accountnumber;
  iban := countrycode + createChecksum(iban) + bankcode + accountnumber;
  Result := iban;
end;

end.
