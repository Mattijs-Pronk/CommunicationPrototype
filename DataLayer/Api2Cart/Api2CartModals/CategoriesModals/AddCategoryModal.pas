unit AddCategoryModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo;

type
TCategoryAdd = class
    private
      Tname, TDescription, Tcategories_ids, Tweight, Tavailable_for_sale,
      Tlang_id, Tavailable_for_view, Tmeta_title, Tmeta_description: String;
    public
      property name: string read Tname write Tname;
        property description: string read TDescription write TDescription;
        property categories_ids: string read Tcategories_ids write Tcategories_ids;
        property weight: string read Tweight write Tweight;
        property available_for_sale: string read Tavailable_for_sale write Tavailable_for_sale;
        property lang_id: string read Tlang_id write Tlang_id;
        property available_for_view: string read Tavailable_for_view write Tavailable_for_view;
        property meta_title: string read Tmeta_title write Tmeta_title;
        property meta_description: string read Tmeta_description write Tmeta_description;

      function CreateObject(): String;
  end;


implementation


function TCategoryAdd.CreateObject: string;
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
