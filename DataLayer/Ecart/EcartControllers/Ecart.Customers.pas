unit Ecart.Customers;

interface

uses
   //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils,
  //units
  Ecart.InterfaceCollection, ConfigurationManager, ErrorHandler;

type

  CustomersController = class(TInterfacedObject, IMyCustomers)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: String);
    destructor Destroy; override;

    function GetAllCustomers: TJSONValue;
    function GetSingleCustomer(customerId: UInt64): TJSONValue;
    function PostCustomer(NewCustomerJSON: TJSONObject): TJSONValue;
    function UpdateCustomer(customerId: UInt64; UpdatedCustomerJSON: TJSONObject): TJSONValue;
    function DeleteCustomer(customerId: UInt64): TJSONValue;
  end;

implementation

constructor CustomersController.Create(ACCES_TOKEN: String);
begin
  Local_AccesToken := ACCES_TOKEN;
  IErrorHandler := ErrorHandlerClass.Create;
end;

destructor CustomersController.Destroy;
begin
  IErrorHandler := nil;
  inherited;
end;



function CustomersController.GetAllCustomers: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'customers').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function CustomersController.GetSingleCustomer(customerId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'customers/' + UIntToStr(customerId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function CustomersController.PostCustomer(NewCustomerJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(NewCustomerJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Post(Ecart_BaseURL + 'customers', RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function CustomersController.UpdateCustomer(customerId: UInt64; UpdatedCustomerJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedCustomerJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'customers/' + UIntToStr(customerId), RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function CustomersController.DeleteCustomer(customerId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Delete(Ecart_BaseURL + 'customers/' + UIntToStr(customerId)).ContentAsString();

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

end.
