unit FindProductModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo;

type
  TProductFind = class
  private
    Tfind_value, Tfind_where, Tfind_param, Tfind_what, Tlang_id, Tstore_id: string;
  public
    property find_value: string read Tfind_value write Tfind_value;
    property find_where: string read Tfind_where write Tfind_where;
    property find_param: string read Tfind_param write Tfind_param;
    property find_what: string read Tfind_what write Tfind_what;
    property lang_id: string read Tlang_id write Tlang_id;
    property store_id: string read Tstore_id write Tstore_id;

    function CreateObject(): String;
  end;

implementation

{ TProduct }

function TProductFind.CreateObject: String;
var
  Params: TStringList;
  Context: TRttiContext;
  Prop: TRttiProperty;
  PropValue: TValue;
begin
  Params := TStringList.Create;
  try
    Params.Delimiter := '&';

    Context := TRttiContext.Create;
    try
      for Prop in Context.GetType(Self.ClassInfo).GetProperties do
      begin
        if Prop.IsReadable then
        begin
          PropValue := Prop.GetValue(Self);
          if not PropValue.IsEmpty and (PropValue.AsType<string> <> '') then
            Params.Add(TIdURI.ParamsEncode(Prop.Name) + '=' + TIdURI.ParamsEncode(PropValue.ToString));
        end;
      end;
    finally
      Context.Free;
    end;

    Result := Params.DelimitedText;
  finally
    Params.Free;
  end;
end;

end.


