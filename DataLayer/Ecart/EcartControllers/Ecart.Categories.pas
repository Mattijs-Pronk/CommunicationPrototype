unit Ecart.Categories;

interface

uses
  //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils,
  //units
  Ecart.InterfaceCollection, ConfigurationManager, ErrorHandler;

type
  CategoriesController = class(TInterfacedObject, IMyCategories)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: string);
    destructor Destroy; override;

    function GetAllCategories: TJSONValue;
    function CountAllCategories: TJSONValue;
    function GetSingleCategory(categoryId: UInt64): TJSONValue;
    function PostCategory(NewCategoryJSON: TJSONObject): TJSONValue;
    function UpdateCategory(categoryid: UInt64; UpdatedCategoryJSON: TJSONObject): TJSONValue;
    function DeleteCategory(categoryId: UInt64): TJSONValue;
  end;

implementation

constructor CategoriesController.Create(ACCES_TOKEN: string);
begin
  Local_AccesToken := ACCES_TOKEN;
  IErrorHandler := ErrorHandlerClass.Create;
end;

destructor CategoriesController.Destroy;
begin
  IErrorHandler := nil;
  inherited;
end;

function CategoriesController.GetAllCategories: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'categories').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function CategoriesController.CountAllCategories: TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'categories/count').ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function CategoriesController.GetSingleCategory(categoryId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    ResponseContent := HttpClient.Get(Ecart_BaseURL + 'categories/' + UIntToStr(categoryId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;

function CategoriesController.PostCategory(NewCategoryJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(NewCategoryJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Post(Ecart_BaseURL + 'categories', RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function CategoriesController.UpdateCategory(categoryid: UInt64; UpdatedCategoryJSON: TJSONObject): TJSONValue;
var
  ResponseContent: string;
  RequestBody: TStringStream;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestBody := TStringStream.Create(UpdatedCategoryJSON.ToJSON, TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Put(Ecart_BaseURL + 'categories/' + UIntToStr(categoryid), RequestBody).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
    RequestBody.Free;
  end;
end;

function CategoriesController.DeleteCategory(categoryId: UInt64): TJSONValue;
var
  ResponseContent: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := Local_AccesToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json';
    ResponseContent := HttpClient.Delete(Ecart_BaseURL + 'categories/' + UIntToStr(categoryId)).ContentAsString;

    Result := IErrorHandler.ErrorHandlerEcart(ResponseContent);

  finally
    HttpClient.Free;
  end;
end;


end.
