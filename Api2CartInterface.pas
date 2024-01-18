unit Api2CartInterface;

interface

uses
  //components
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON,

  //modals
  FindProductModal, UpdateProductmodal, AddProductModal,
  AddProductVariantModal, AddProductImageModal, UpdateProductVariantModal,
  AddProductOptionModal, AddProductAttributeValueModal, FindCategoryModal,
  AddCategoryModal, UpdateCategoryModal,

  //units
  EcomConnect, JsonFiles;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    ID1: TEdit;
    ID2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GetAll: TButton;
    Products: TLabel;
    switchPlatformlabel2: TLabel;
    SwitchPlatform: TButton;
    ProductsCountAll: TButton;
    ProductsGetSingle: TButton;
    param: TEdit;
    Label3: TLabel;
    ProductAdd: TButton;
    ProductUpdate: TButton;
    ProductImageAdd: TButton;
    Label4: TLabel;
    Button2: TButton;
    ProductsFind: TButton;
    ProductAttributeList: TButton;
    ProductVariantAdd: TButton;
    ProductChildItemList: TButton;
    ProductVariantList: TButton;
    ProductVariantInfo: TButton;
    ProductVariantCount: TButton;
    ProductVariantUpdate: TButton;
    ProductCurrencyList: TButton;
    ProductDelete: TButton;
    ProductImageDelete: TButton;
    ProductAddOption: TButton;
    ProductVariantDelete: TButton;
    ProductAttributeSet: TButton;
    ProductImageUpdate: TButton;
    Label5: TLabel;
    CategoriesList: TButton;
    CategorieCount: TButton;
    CategorieInfo: TButton;
    CategorieFind: TButton;
    CategorieAdd: TButton;
    CategorieUpdate: TButton;
    procedure GetAllClick(Sender: TObject);
    procedure SwitchPlatformClick(Sender: TObject);
    procedure ProductsCountAllClick(Sender: TObject);
    procedure ProductsGetSingleClick(Sender: TObject);
    procedure ProductAddClick(Sender: TObject);
    procedure ProductUpdateClick(Sender: TObject);
    procedure ProductImageAddClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ProductsFindClick(Sender: TObject);
    procedure ProductAttributeListClick(Sender: TObject);
    procedure ProductVariantAddClick(Sender: TObject);
    procedure ProductChildItemListClick(Sender: TObject);
    procedure ProductVariantListClick(Sender: TObject);
    procedure ProductVariantInfoClick(Sender: TObject);
    procedure ProductVariantCountClick(Sender: TObject);
    procedure ProductVariantUpdateClick(Sender: TObject);
    procedure ProductCurrencyListClick(Sender: TObject);
    procedure ProductDeleteClick(Sender: TObject);
    procedure ProductImageDeleteClick(Sender: TObject);
    procedure ProductAddOptionClick(Sender: TObject);
    procedure ProductVariantDeleteClick(Sender: TObject);
    procedure ProductAttributeSetClick(Sender: TObject);
    procedure ProductImageUpdateClick(Sender: TObject);
    procedure CategoriesListClick(Sender: TObject);
    procedure CategorieCountClick(Sender: TObject);
    procedure CategorieInfoClick(Sender: TObject);
    procedure CategorieFindClick(Sender: TObject);
    procedure CategorieAddClick(Sender: TObject);
    procedure CategorieUpdateClick(Sender: TObject);
  private
    { Private declarations }
    _EcomConnectContainer: EcomConnectContainer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setWebshopToken();
  end;

var
  Form2: TForm2;
  isWooCommerce: Boolean = True;

implementation

{$R *.dfm}


procedure TForm2.Button2Click(Sender: TObject);
begin
    Close;
end;

constructor TForm2.Create(AOwner: TComponent);
begin
  inherited;
    setWebshopToken();
end;

destructor TForm2.Destroy;
begin
  _EcomConnectContainer.Free;
  inherited;
end;

procedure TForm2.setWebshopToken();
begin
  if(isWooCommerce) THEN
  begin
    // WooCommerce Shop ACCES_TOKEN:
    _EcomConnectContainer := EcomConnectContainer.Create(Api2Cart_Type,
    '62d06f6e016ce85b2dbf3ed2cc3cbfa8');
    switchPlatformlabel2.Caption := 'WooCommerce';
  end
  else
  begin
    // Shopify Shop ACCES_TOKEN:
    _EcomConnectContainer := EcomConnectContainer.Create(Api2Cart_Type,
    '2c658c3182968a290a6396fe37fb2975');
    switchPlatformlabel2.Caption := 'Shopify';
  end;
  isWooCommerce := not isWooCommerce;
end;


procedure TForm2.SwitchPlatformClick(Sender: TObject);
begin
  setWebshopToken();
end;

procedure TForm2.CategorieAddClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Category: TCategoryAdd;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Category := TCategoryAdd.Create;
  Category.name := 'CategoryViaApi2Cart';
  Category.description := 'CategoryViaApi2Cart test';
  Category.meta_title := 'test item';
  Category.meta_description := 'test item test item';
  Category.weight := '2';
  JsonObject := nil;

  try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Categorie_Add(Category);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.CategorieCountClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Category_Count;
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.CategorieFindClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Category: TCategoryFind;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Category := TCategoryFind.Create;
  Category.find_value := 'test';
  Category.find_where := 'name';
  Category.find_param := 'whole_words';
  JsonObject := nil;

  try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Categorie_Find(Category);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.CategorieInfoClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Categorie_Info(StrToInt64(ID1.Text), param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.CategoriesListClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Category_List(param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.CategorieUpdateClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Category: TCategoryUpdate;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Category := TCategoryUpdate.Create;
  Category.name := 'UpdatedCategoryViaApi2Cart';
  Category.description := 'UpdatedCategoryViaApi2Cart test';
  Category.meta_description := 'update test';
  Category.meta_keywords := 'update test update test';
  JsonObject := nil;

  try
    JsonObject := _EcomConnectContainer.api2Cart_Categories.Categorie_Update(StrToInt64(ID1.Text), Category);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.GetAllClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Products_list(param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductAddClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductAdd;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductAdd.Create;
  Product.name := 'createdProductViaApi2Cart';
  Product.description := 'createdProductViaApi2Cart';
  Product.price := '999';
  Product.quantity := '999';

  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_add(Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductAddOptionClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductOptionAdd;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductOptionAdd.Create;
  Product.name := 'Size';
  Product.default_option_value := 'L';
  JsonObject := nil;

  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Option_Add(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductAttributeListClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Attribute_list(StrToInt64(ID1.Text), param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductAttributeSetClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductAttributeValueAdd;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductAttributeValueAdd.Create;
  Product.attribute_name := 'Color';
  Product.value	 := 'Red';
  JsonObject := nil;

  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Attribute_Value_Set(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductChildItemListClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_ChildItem_List(StrToInt64(ID1.Text), param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductCurrencyListClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Currency_List(param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductDeleteClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Delete(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductImageAddClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductAddImage;
begin
  JsonObject := nil;
  //TProductAddImage aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductAddImage.Create;
  Product.image_name := 'ImageViaApi2Cart.png';
  Product.url := 'https://www.google.com/images/srpr/logo1w.png';
  Product._type := 'additional';

  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.product_image_add(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductImageDeleteClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Image_Delete(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductImageUpdateClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Image_Update(StrToInt64(ID1.Text), ID2.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductsCountAllClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Products_count();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductsFindClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductFind;
begin
  JsonObject := nil;
  //TProductFind aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductFind.Create;
  Product.find_value := 'testProductApi2Cart';
  Product.find_where := 'name';
  Product.find_param := 'whole_words';
  Product.find_what := 'product';

  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_find(Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductsGetSingleClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_info(StrToInt64(ID1.Text), param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductUpdateClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductUpdate;
begin
  JsonObject := nil;
  //TProductUpdate aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductUpdate.Create;
  Product.name := 'updatedProductViaApi2Cart';
  Product.description := 'updateProductViaApi2Cart';
  Product.price := '1';
  Product.quantity := '1';
  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_update(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

procedure TForm2.ProductVariantAddClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductAddVariant;
begin
  JsonObject := nil;
  //TProductUpdate aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductAddVariant.Create;
  Product.model := 'AddVariantViaApi2Cart';
  Product.TattributeFirst := 'Size';
  Product.TattributeSecond := 'L';
  Product.TattributeKey := '999';
  Product.price	 := '666';
  Product.quantity := '666';
  Product.weight := '0.5';

  JsonObject := nil;
  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_variant_Add(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
    Product.Free;
  end;
end;

procedure TForm2.ProductVariantCountClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_variant_Count(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductVariantDeleteClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Variant_Delete(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductVariantInfoClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Variant_Info(StrToInt64(ID1.Text), param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductVariantListClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_Variant_List(param.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm2.ProductVariantUpdateClick(Sender: TObject);
var
  JsonObject: TJSONValue;
  Product: TProductVariantUpdate;
begin
  JsonObject := nil;
  //TProductUpdate aanmaken, hiervoor moet wel de juiste unit in "USES" gezet worden.
  Product := TProductVariantUpdate.Create;
  Product.sku := 'SKU1111';
  Product.price := '1';
  Product.quantity := '1';

  JsonObject := nil;
  try
    JsonObject := _EcomConnectContainer.api2Cart_Products.Product_variant_Update(StrToInt64(ID1.Text), Product);
    Memo1.Lines.Text := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;
end;

//var
//  ResponseContent: string;
//  Params: TStringList;
//  URL: string;
//begin
//  HttpClient := TNetHTTPClient.Create(nil);
//  Params := TStringList.Create;
//  try
//    Params.Add('api_key=' + Api2Cart_ApiKey);
//    Params.Add('store_key=2c658c3182968a290a6396fe37fb2975');
//    Params.Add('start=0');
//    Params.Add('count=10');
//    Params.Add('params=id,model,name,description,price,url,create_at,quantity,categories_ids,inventory');
//
//    URL := Api2Cart_BaseURL + 'product.list.json?' + StringReplace(Params.Text, #$D#$A, '&', [rfReplaceAll]);
//    URL := TIdURI.URLEncode(URL);
//
//    ResponseContent := HttpClient.Get(URL).ContentAsString;
//
//    Memo1.Lines.Text := ResponseContent;
//  finally
//    HttpClient.Free;
//  end;
//end;

end.
