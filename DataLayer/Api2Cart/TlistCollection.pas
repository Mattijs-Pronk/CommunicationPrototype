unit TlistCollection;

interface

uses
  System.Generics.Collections, System.Classes, System.SysUtils, IdURI;

type
  TInventoryItem = class
    // Je kunt hier properties toevoegen voor de gegevens in "inventory" indien nodig
  end;

  TGroupItem = class
    // Je kunt hier properties toevoegen voor de gegevens in "group_items" indien nodig
  end;

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
    Params.Add(TIdURI.ParamsEncode('find_value') + '=' + TIdURI.ParamsEncode(find_value));

  if find_where <> '' then
    Params.Add(TIdURI.ParamsEncode('find_where') + '=' + TIdURI.ParamsEncode(find_where));

  if find_param <> '' then
    Params.Add(TIdURI.ParamsEncode('find_param') + '=' + TIdURI.ParamsEncode(find_param));

  if find_what <> '' then
    Params.Add(TIdURI.ParamsEncode('find_what') + '=' + TIdURI.ParamsEncode(find_what));

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

