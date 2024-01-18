unit UpdateProductVariantModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo;

type
TProductVariantUpdate = class
    private
      Tsku, Tprice, Tspecial_price, Tquantity, Tincrease_quantity,
      Treduce_quantity, Tmanage_stock, Tbackorder_status, Twidth, Theight,
      Tlength, Twarehouse_id, Tstatus, Tean, Tproduct_id, Told_price,
      Tcost_price, Ttaxable, Tweight, Tbarcode, Toptions,
      Tharmonized_system_code, Tcountry_of_origin: String;
    public
      property sku: string read Tsku write Tsku;
      property price: string read Tprice write Tprice;
      property special_price: string read Tspecial_price write Tspecial_price;
      property quantity: string read Tquantity write Tquantity;
      property increase_quantity: string read Tincrease_quantity write Tincrease_quantity;
      property reduce_quantity: string read Treduce_quantity write Treduce_quantity;
      property manage_stock: string read Tmanage_stock write Tmanage_stock;
      property backorder_status: string read Tbackorder_status write Tbackorder_status;
      property width: string read Twidth write Twidth;
      property height: string read Theight write Theight;
      property length: string read Tlength write Tlength;
      property warehouse_id: string read Twarehouse_id write Twarehouse_id;
      property status: string read Tstatus write Tstatus;
      property ean: string read Tean write Tean;
      property product_id: string read Tproduct_id write Tproduct_id;
      property old_price: string read Told_price write Told_price;
      property cost_price: string read Tcost_price write Tcost_price;
      property taxable: string read Ttaxable write Ttaxable;
      property weight: string read Tweight write Tweight;
      property barcode: string read Tbarcode write Tbarcode;
      property options: string read Toptions write Toptions;
      property harmonized_system_code: string read Tharmonized_system_code write Tharmonized_system_code;
      property country_of_origin: string read Tcountry_of_origin write Tcountry_of_origin;


      function CreateObject(): String;
  end;

implementation

function TProductVariantUpdate.CreateObject: String;
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
