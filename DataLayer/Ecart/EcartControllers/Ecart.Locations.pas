unit Ecart.Locations;

interface

uses
   //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils,
  //units
  Ecart.InterfaceCollection, ConfigurationManager, ErrorHandler;

type

  //Function aanmaken.
  LocationsController = class(TInterfacedObject, IMyLocations)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: String);
    destructor Destroy; override;


    function GetAllLocations: TJSONValue;
    function CountAllLocations: TJSONValue;
    function GetSingleLocation(locationId: UInt64): TJSONValue;
    function GetAllInventoriesByLocation(locationId: UInt64): TJSONValue;
    function GetAllLocationsByInventory(inventoryId: UInt64): TJSONValue;
    function GetSingleInventory(locationId, inventoryId: UInt64): TJSONValue;
    function UpdateInventory(locationId, inventoryId: UInt64; UpdatedInventoryJSON: TJSONObject): TJSONValue;
  end;


implementation

constructor LocationsController.Create(ACCES_TOKEN: String);
begin
  Local_AccesToken := ACCES_TOKEN;
  IErrorHandler := ErrorHandlerClass.Create;
end;

destructor LocationsController.Destroy;
begin
  IErrorHandler := nil;
  inherited;
end;



function LocationsController.GetAllLocations: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.CountAllLocations: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations/count').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.GetSingleLocation(locationId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations/' + UIntToStr(locationId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.GetAllInventoriesByLocation(locationId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations//inventories?locationId=' + UIntToStr(locationId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.GetAllLocationsByInventory(inventoryId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations/inventories?inventoryId=' + UIntToStr(inventoryId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.GetSingleInventory(locationId, inventoryId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'locations/' + UIntToStr(locationId) + '/inventories/' + UIntToStr(inventoryId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function LocationsController.UpdateInventory(locationId, inventoryId: UInt64; UpdatedInventoryJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedInventoryJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'locations/' + UIntToStr(locationId) +'/inventories/' + UIntToStr(inventoryId), RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

end.
