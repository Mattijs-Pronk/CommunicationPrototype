unit ProductReturnModal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, IdURI, System.Rtti, System.Variants, TypInfo, System.JSON, vcl.Dialogs,  Generics.Collections;

type
  TProductcreate_at = class
    private
      Tvalue, Tformat:String;
    public
      property value: string read Tvalue write Tvalue;
      property format: string read Tformat write Tformat;
  end;

  TProductList = class
  private
    Tid, Ttype, Tu_model, Tu_sku, Tname, Tdescription, Tshort_description,
    Tprice, Tadvanced_price, Tcost_price, Tquantity, Tinventory, Tgroup_items,
    Tu_brand_id, Tu_brand, Tcategories_ids, Tstores_ids, Turl, Tseo_url,
    Tmeta_title, Tmeta_keywords, Tmeta_description, Tavail_sale, Tavail_view,
    Tis_virtual, Tis_downloadable, Tweight, Tweight_unit, Tsort_order,
    Tin_stock, Tbackorders, Tmanage_stock, Tis_stock_managed,
    Tmodified_at, Ttax_class_id, Tspecial_price, Ttier_price, Tgroup_price,
    Timages, Tproduct_options, Tu_upc, Tu_mpn, Tu_gtin, Tu_isbn, Tu_ean,
    Trelated_products_ids, Tdimensions_unit, Twidth, Theight, Tlength,
    Tdiscounts, Tadditional_fields: string;

    Tcreate_at: TProductcreate_at;
  public
    property id: string read Tid write Tid;
//    property _type: string read Ttype write Ttype;
    property u_model: string read Tu_model write Tu_model;
    property u_sku: string read Tu_sku write Tu_sku;
    property name: string read Tname write Tname;
    property description: string read Tdescription write Tdescription;
    property short_description: string read Tshort_description write Tshort_description;
    property price: string read Tprice write Tprice;
    property advanced_price: string read Tadvanced_price write Tadvanced_price;
    property cost_price: string read Tcost_price write Tcost_price;
    property quantity: string read Tquantity write Tquantity;
    property inventory: string read Tinventory write Tinventory;
    property group_items: string read Tgroup_items write Tgroup_items;
    property u_brand_id: string read Tu_brand_id write Tu_brand_id;
    property u_brand: string read Tu_brand write Tu_brand;
    property categories_ids: string read Tcategories_ids write Tcategories_ids;
    property stores_ids: string read Tstores_ids write Tstores_ids;
    property url: string read Turl write Turl;
    property seo_url: string read Tseo_url write Tseo_url;
    property meta_title: string read Tmeta_title write Tmeta_title;
    property meta_keywords: string read Tmeta_keywords write Tmeta_keywords;
    property meta_description: string read Tmeta_description write Tmeta_description;
    property avail_sale: string read Tavail_sale write Tavail_sale;
    property avail_view: string read Tavail_view write Tavail_view;
    property is_virtual: string read Tis_virtual write Tis_virtual;
    property is_downloadable: string read Tis_downloadable write Tis_downloadable;
    property weight: string read Tweight write Tweight;
    property weight_unit: string read Tweight_unit write Tweight_unit;
    property sort_order: string read Tsort_order write Tsort_order;
    property in_stock: string read Tin_stock write Tin_stock;
    property backorders: string read Tbackorders write Tbackorders;
    property manage_stock: string read Tmanage_stock write Tmanage_stock;
    property is_stock_managed: string read Tis_stock_managed write Tis_stock_managed;
    property create_at: TProductcreate_at read Tcreate_at write Tcreate_at;
    property modified_at: string read Tmodified_at write Tmodified_at;
    property tax_class_id: string read Ttax_class_id write Ttax_class_id;
    property special_price: string read Tspecial_price write Tspecial_price;
    property tier_price: string read Ttier_price write Ttier_price;
    property group_price: string read Tgroup_price write Tgroup_price;
    property images: string read Timages write Timages;
    property product_options: string read Tproduct_options write Tproduct_options;
    property u_upc: string read Tu_upc write Tu_upc;
    property u_mpn: string read Tu_mpn write Tu_mpn;
    property u_gtin: string read Tu_gtin write Tu_gtin;
    property u_isbn: string read Tu_isbn write Tu_isbn;
    property u_ean: string read Tu_ean write Tu_ean;
    property related_products_ids: string read Trelated_products_ids write Trelated_products_ids;
    property dimensions_unit: string read Tdimensions_unit write Tdimensions_unit;
    property width: string read Twidth write Twidth;
    property height: string read Theight write Theight;
    property length: string read Tlength write Tlength;
    property discounts: string read Tdiscounts write Tdiscounts;
    property additional_fields: string read Tadditional_fields write Tadditional_fields;

    procedure AssignObject(const APropertyName: string; AValue: Array of String);
    function ReturnObject(content: String): TObjectList<TProductList>;
  end;

implementation

procedure TProductList.AssignObject(const APropertyName: string; AValue: Array of String);
var
  ctx: TRttiContext;
  prop: TRttiProperty;
begin
  ctx := TRttiContext.Create;
  try
    prop := ctx.GetType(TProductList).GetProperty(APropertyName);
    if Assigned(prop) then
    begin
      if prop.PropertyType.IsInstance and (prop.PropertyType.AsInstance.MetaclassType = TProductcreate_at) then
      begin
        Tcreate_at := TProductcreate_at.Create;
        Tcreate_at.value := AValue[0];
        Tcreate_at.format := AValue[1];
        prop.SetValue(Self, TValue.From<TProductcreate_at>(Tcreate_at));
      end
      else
      begin
        prop.SetValue(Self, TValue.From<string>(AValue[0]));
      end;
    end;
  finally
    ctx.Free;
  end;
end;






function TProductList.ReturnObject(content: String): TObjectList<TProductList>;
var
  jsonValue: TJSONValue;
  productArray: TJSONArray;
  product: TJSONObject;
  productList: TObjectList<TProductList>;
  i, j: Integer;
  productObj: TProductList;
  propName, createAtValue, createAtFormat: string;
  createAtObject: TJSONObject;
begin
  productList := TObjectList<TProductList>.Create;
  jsonValue := TJSONObject.ParseJSONValue(content);

  try
    if Assigned(jsonValue) and (jsonValue is TJSONObject) then
    begin
      if (jsonValue as TJSONObject).TryGetValue<TJSONArray>('result.product', productArray) then
      begin
        for i := 0 to productArray.Count - 1 do
        begin
          product := productArray.Items[i] as TJSONObject;

          productObj := TProductList.Create;

          for j := 0 to product.Count - 1 do
          begin
            propName := product.Pairs[j].JsonString.Value;

            //als propName create_at
            if propName = 'create_at' then
            begin
              createAtObject := product.GetValue(propName) as TJSONObject;

              if Assigned(createAtObject) and createAtObject.TryGetValue<string>('value', createAtValue) and
                createAtObject.TryGetValue<string>('format', createAtFormat) then
              begin
                productObj.AssignObject('create_at', [createAtValue, createAtFormat]);
              end;
            end
            //de rest
            else
            begin
              productObj.AssignObject(propName, [product.GetValue(propName).Value]);
            end;
          end;

          productList.Add(productObj);
        end;
      end;
    end;
  finally
    jsonValue.Free;
  end;

  Result := productList;
end;




end.
