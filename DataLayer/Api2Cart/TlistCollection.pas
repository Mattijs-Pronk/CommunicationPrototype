unit TlistCollection;

interface

uses
  System.Generics.Collections, System.Classes, System.SysUtils, IdURI;

type
  TProduct = class
  private
    Tfind_value: string;
    Tfind_where: string;
    Tfind_param: string;
    Tfind_what: string;
  public
    property find_value: string read Tfind_value write Tfind_value;
    property find_where: string read Tfind_where write Tfind_where;
    property find_param: string read Tfind_param write Tfind_param;
    property find_what: string read Tfind_what write Tfind_what;
    function ProductLoop(): String;
  end;

implementation

{ TProduct }

function TProduct.ProductLoop(): String;
var
  Params: TStringList;
  i: Integer;
begin
  Params := TStringList.Create;

  if find_value <> '' then
  begin
    Params.Add(TIdURI.ParamsEncode('find_value') + '=' + TIdURI.ParamsEncode(find_value));
  end;

  if find_where <> '' then
  begin
    Params.Add(TIdURI.ParamsEncode('find_where') + '=' + TIdURI.ParamsEncode(find_where));
  end;

  if find_param <> '' then
  begin
    Params.Add(TIdURI.ParamsEncode('find_param') + '=' + TIdURI.ParamsEncode(find_param));
  end;

  if find_what <> '' then
  begin
    Params.Add(TIdURI.ParamsEncode('find_what') + '=' + TIdURI.ParamsEncode(find_what));
  end;


  Result := '';
  for i := 0 to Params.Count - 1 do
  begin
    if i > 0 then
      Result := Result + '&';
    Result := Result + Params[i];
  end;

  Params.Free;
end;



end.


