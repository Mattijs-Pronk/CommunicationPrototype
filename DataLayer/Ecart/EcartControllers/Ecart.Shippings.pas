unit Ecart.Shippings;

interface

uses
   //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils,
  //units
  Ecart.InterfaceCollection, ConfigurationManager, ErrorHandler;

type

  //Function aanmaken.
  ShippingsController = class(TInterfacedObject, IMyShippings)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: String);
    destructor Destroy; override;

    function GetAllShippings: TJSONValue;
    function GetSingleShipping(shippingId: String): TJSONValue;

    function GetAllShippingMethods(shippingzoneId: UInt64): TJSONValue;
    function GetSingleShippingMethod(shippingzoneId, shippingmethodId: UInt64): TJSONValue;
    function UpdateShippingMethod(shippingzoneId, shippingmethodId: UInt64; UpdatedShippingMethodJSON: TJSONObject): TJSONValue;
    function PostShippingMethod(shippingzoneId: UInt64; NewShippingMethodJSON: TJSONObject): TJSONValue;
    function DeleteShippingMethod(shippingzoneId, shippingmethodId: UInt64): TJSONValue;

    function GetAllShippingMethodsFromShippingZone: TJSONValue;
    function GetSingleShippingMethodFromShippingZone(shippingzoneId: UInt64): TJSONValue;
    function UpdateShippingZone(shippingzoneId: UInt64; UpdatedShippingZoneJSON: TJSONObject): TJSONValue;
    function PostShippingZone(NewShippingZoneJSON: TJSONObject): TJSONValue;
    function DeleteShippingZone(shippingzoneId: UInt64): TJSONValue;

    function GetAllShippingZoneLocations(shippingzoneId: UInt64): TJSONValue;
    function UpdateShippingZoneLocation(shippingzoneId: UInt64; UpdatedShippingZoneLocationJSON: TJSONObject): TJSONValue;
  end;


implementation

constructor ShippingsController.Create(ACCES_TOKEN: String);
begin
  Local_AccesToken := ACCES_TOKEN;
  IErrorHandler := ErrorHandlerClass.Create;
end;

destructor ShippingsController.Destroy;
begin
  IErrorHandler := nil;
  inherited;
end;



function ShippingsController.GetAllShippings: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetSingleShipping(shippingId: String): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/' + shippingId).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetAllShippingMethods(shippingzoneId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/methods').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetSingleShippingMethod(shippingzoneId,shippingmethodId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + 'zones/' + UIntToStr(shippingmethodId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.UpdateShippingMethod(shippingzoneId, shippingmethodId: UInt64; UpdatedShippingMethodJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedShippingMethodJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/methods/' + UIntToStr(shippingmethodId), RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function ShippingsController.PostShippingMethod(shippingzoneId: UInt64; NewShippingMethodJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(NewShippingMethodJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Post(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/methods', RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function ShippingsController.DeleteShippingMethod(shippingzoneId, shippingmethodId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Delete(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/methods/' + UIntToStr(shippingmethodId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetAllShippingMethodsFromShippingZone: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/zones').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetSingleShippingMethodFromShippingZone(shippingzoneId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.UpdateShippingZone(shippingzoneId: UInt64; UpdatedShippingZoneJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedShippingZoneJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId), RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function ShippingsController.PostShippingZone(NewShippingZoneJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(NewShippingZoneJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Post(Ecart_BaseURL + 'shippings/zones', RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function ShippingsController.DeleteShippingZone(shippingzoneId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Delete(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.GetAllShippingZoneLocations(shippingzoneId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/locations').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function ShippingsController.UpdateShippingZoneLocation(shippingzoneId: UInt64; UpdatedShippingZoneLocationJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedShippingZoneLocationJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'shippings/zones/' + UIntToStr(shippingzoneId) + '/locations', RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

end.
