unit AddProductOptionModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo;

type
  TProductOptionAdd = class
  private
    Tname, Tdefault_option_value: string;
  public
    property name: string read Tname write Tname;
    property default_option_value: string read Tdefault_option_value write Tdefault_option_value;

    function CreateObject(): String;
  end;

implementation

{ TProduct }

function TProductOptionAdd.CreateObject: String;
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
