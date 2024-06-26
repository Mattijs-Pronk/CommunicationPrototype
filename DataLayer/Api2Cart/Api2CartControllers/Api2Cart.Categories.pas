unit Api2Cart.Categories;

interface

uses
   //components
  System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Classes, System.SysUtils, IdURI,
  //units
  Api2Cart.InterfaceCollection, ConfigurationManager, ErrorHandler,
  //modals
  FindCategoryModal, AddCategoryModal, UpdateCategoryModal;

type

  //Function aanmaken.
  ProductsController = class(TInterfacedObject, IMyCategories)
  private
    HttpClient: TNetHTTPClient;
    IErrorHandler: IMyErrorHandler;
    Local_AccesToken: String;
  public
    constructor Create(ACCES_TOKEN: String);
    destructor Destroy; override;

    function Category_List(param: String): TJSONValue;
    function Category_Count(): TJSONValue;
    function Categorie_Info(categoryId: UInt64; param: String): TJSONValue;
    function Categorie_Find(Category: TCategoryFind): TJSONValue;
    function Categorie_Add(Category: TCategoryAdd): TJSONValue;
    function Categorie_Update(categoryId: UInt64; Category: TCategoryUpdate): TJSONValue;
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



function ProductsController.Category_List(param: String): TJSONValue;
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

    URL := Api2Cart_BaseURL + 'category.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Category_Count: TJSONValue;
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

    URL := Api2Cart_BaseURL + 'category.count.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Categorie_Info(categoryId: UInt64; param: string): TJSONValue;
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
    Params.Add('id=' + UIntToStr(categoryId));

    if not param.IsEmpty then
    begin
      Params.Add('params=' + param);
    end
    else
    begin
      Params.Add('params=force_all');
    end;

    URL := Api2Cart_BaseURL + 'category.info.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Categorie_Find(Category: TCategoryFind): TJSONValue;
var
  ResponseContent: string;
  Params: TStringList;
  URL: string;
  HttpClient: TNetHTTPClient;
  Category1: TCategoryFind;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  Params := TStringList.Create;
  try
    Params.Add('api_key=' + TIdURI.ParamsEncode(Api2Cart_ApiKey));
    Params.Add('store_key=' + TIdURI.ParamsEncode(Local_AccesToken));
    Params.Add(Category.CreateObject());

    URL := Api2Cart_BaseURL + 'category.find.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Categorie_Add(Category: TCategoryAdd): TJSONValue;
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
    Params.Add(Category.CreateObject());

    URL := Api2Cart_BaseURL + 'category.add.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;

function ProductsController.Categorie_Update(categoryId: UInt64; Category: TCategoryUpdate): TJSONValue;
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
    Params.Add('id=' + UIntToStr(categoryId));
    //parameters toevoegen uit via een function in de TListCollection unit.
    Params.Add(Category.CreateObject());

    URL := Api2Cart_BaseURL + 'category.update.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
    URL := TIdURI.URLEncode(URL);

    ResponseContent := HttpClient.Get(URL).ContentAsString;

    Result := IErrorHandler.ErrorHandlerApi2Cart(ResponseContent);

  finally
    HttpClient.Free;
    Params.Free;
  end;
end;



end.
