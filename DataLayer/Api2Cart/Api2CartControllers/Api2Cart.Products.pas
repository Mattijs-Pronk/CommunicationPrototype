unit Api2Cart.Products;

interface

uses
   //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils, IdURI, Vcl.Dialogs,
  //units
  Api2Cart.InterfaceCollection, ConfigurationManager, ErrorHandler, TListCollection;

type

  //Function aanmaken.
  ProductsController = class(TInterfacedObject, IMyProducts)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: String);
    destructor Destroy; override;


    function Products_list(param: String): TJSONValue;
    function Products_count: TJSONValue;
    function Product_info(productId: UInt64; param: String): TJSONValue;
    function Product_find(Product: TProduct): TJSONValue;
    function Product_add(NewProductJson: TJSONObject): TJSONValue;
    function Product_update(productId: UInt64; UpdateProductJson: TJSONObject): TJSONValue;
    function product_image_add(productId: UInt64; CreateNewProductImageJson: TJSONObject): TJSONValue;
    function Product_Attribute_list(productId: UInt64; param: String): TJSONValue;
    function Product_variant_Add(productId: UInt64; CreateNewProductVariantAddJson: TJSONObject): TJSONValue;
    function Product_ChildItem_List(productId: UInt64; param: String): TJSONValue;
    function Product_Variant_List(param: String): TJSONValue;
    function Product_Variant_Info(variantId: UInt64; param: String): TJSONValue;
    function Product_variant_Count(productId: UInt64): TJSONValue;
    function Product_variant_Update(variantId: UInt64; CreateNewProductVariantUpdateJson: TJSONObject): TJSONValue;
    function Product_Currency_List(param: String): TJSONValue;
    function Product_Delete(productId: UInt64): TJSONValue;
    function Product_Image_Delete(productId, imageId: UInt64): TJSONValue;
    function Product_Option_Add(productId: UInt64; CreateNewProductOptionAddJson: TJSONObject): TJSONValue;
    function Product_Variant_Delete(productId, variantId: UInt64): TJSONValue;
    function Product_Attribute_Value_Set(productId: UInt64; CreateNewProductAttributeSetJson: TJSONObject): TJSONValue;
    function Product_Image_Update(productId: UInt64; imageId: String):TJSONValue;
  end;


implementation



constructor ProductsController.Create(ACCES_TOKEN: String);
begin
  Local_AccesToken := ACCES_TOKEN;
  IErrorHandler := ErrorHandlerClass.Create;
end;

destructor ProductsController.Destroy;
begin
  IErrorHandler := nil;
  inherited;
end;



function ProductsController.Products_list(param: String): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));

    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Products_count: TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));

    URL := Api2Cart_BaseURL + 'product.count.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_info(productId: UInt64; param: String): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('id=' + UIntToStr(productId));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.info.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_find(Product: TProduct): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    //parameters toevoegen uit via een function in de TListCollection unit.
    Params.Add(Product.ProductLoop());

//    for Pair in CreateFindProductJson do
//      begin
//        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
//        TIdURI.ParamsEncode(Pair.JsonValue.Value));
//      end;

    URL := Api2Cart_BaseURL + 'product.find.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_add(NewProductJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));

    for Pair in NewProductJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.add.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_update(productId: UInt64; UpdateProductJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('id=' + UIntToStr(productId));

    for Pair in UpdateProductJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.update.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.product_image_add(productId: UInt64; CreateNewProductImageJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));

    for Pair in CreateNewProductImageJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.image.add.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Attribute_list(productId: UInt64; param: string): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.attribute.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_variant_Add(productId: UInt64; CreateNewProductVariantAddJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));

    for Pair in CreateNewProductVariantAddJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.variant.add.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_ChildItem_List(productId: UInt64; param: string): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.child_item.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Variant_List(param: string): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.variant.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Variant_Info(variantId: UInt64; param: string): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('id=' + UIntToStr(variantId));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.variant.info.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_variant_Count(productId: UInt64): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));

    URL := Api2Cart_BaseURL + 'product.variant.count.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_variant_Update(variantId: UInt64; CreateNewProductVariantUpdateJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('id=' + UIntToStr(variantId));

    for Pair in CreateNewProductVariantUpdateJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.variant.update.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Currency_List(param: string): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'product.currency.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Delete(productId: UInt64): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('id=' + UIntToStr(productId));

    URL := Api2Cart_BaseURL + 'product.delete.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Image_Delete(productId: UInt64; imageId: UInt64): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));
    Params.Add('id=' + UIntToStr(imageId));

    URL := Api2Cart_BaseURL + 'product.image.delete.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Option_Add(productId: UInt64; CreateNewProductOptionAddJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));

    for Pair in CreateNewProductOptionAddJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.option.add.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Variant_Delete(productId: UInt64; variantId: UInt64): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));
    Params.Add('id=' + UIntToStr(variantId));

    URL := Api2Cart_BaseURL + 'product.variant.delete.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Attribute_Value_Set(productId: UInt64; CreateNewProductAttributeSetJson: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));

    for Pair in CreateNewProductAttributeSetJson do
      begin
        Params.Add(TIdURI.ParamsEncode(Pair.JsonString.Value) + '=' +
        TIdURI.ParamsEncode(Pair.JsonValue.Value));
      end;

    URL := Api2Cart_BaseURL + 'product.attribute.value.set.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Product_Image_Update(productId: UInt64; imageId: String): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  Pair: TJSONPair;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add('product_id=' + UIntToStr(productId));
    Params.Add('id=' + TIdURI.ParamsEncode(imageId));

    URL := Api2Cart_BaseURL + 'product.image.update.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

end.
