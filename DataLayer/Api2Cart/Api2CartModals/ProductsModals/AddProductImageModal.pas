unit AddProductImageModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo;

type
TProductAddImage = class
    private
      Timage_name, Ttype, Turl, Tlabel, Tmime, Tposition, Tcontent,
      Tproduct_variant_id, Tvariant_ids, Tstore_id : String;
    public
      property image_name: string read Timage_name write Timage_name;
      property _type: string read Ttype write Ttype;
      property url: string read Turl write Turl;
      property _label: string read Tlabel write Tlabel;
      property mime: string read Tmime write Tmime;
      property position: string read Tposition write Tposition;
      property content: string read Tcontent write Tcontent;
      property product_variant_id: string read Tproduct_variant_id write Tproduct_variant_id;
      property variant_ids: string read Tvariant_ids write Tvariant_ids;
      property store_id: string read Tstore_id write Tstore_id;

      function CreateObject(): String;
  end;

implementation

function TProductAddImage.CreateObject: String;
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
