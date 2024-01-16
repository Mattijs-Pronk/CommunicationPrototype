unit CommunicationInterface;

interface

uses
  //components
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON,
  //units
  EcomConnect, JsonFiles, Api2CartInterface;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GetAll: TButton;
    GetSingle: TButton;
    CountAll: TButton;
    Post: TButton;
    Update: TButton;
    Delete: TButton;
    Label1: TLabel;
    ID1: TEdit;
    Label2: TLabel;
    SwitchPlatform: TButton;
    SwitchPlatformLabel: TLabel;
    CustomersLabel: TLabel;
    GetAllCustomers: TButton;
    GetSingleCustomer: TButton;
    PostCustomer: TButton;
    UpdateCustomer: TButton;
    DeleteCustomer: TButton;
    OrdersLabel: TLabel;
    GetAllOrders: TButton;
    GetSingleOrder: TButton;
    CountAllOrders: TButton;
    UpdateOrder: TButton;
    PostOrder: TButton;
    DeleteOrder: TButton;
    PostOrderComplete: TButton;
    GetAllOrderFulfillments: TButton;
    GetSingleOrderFulfillment: TButton;
    PostOrderFulfillment: TButton;
    UpdateOrderFulfillment: TButton;
    GetAllOrderFulfillmentLocations: TButton;
    GetAllOrderRisks: TButton;
    GetSingleOrderRisk: TButton;
    PostOrderRisk: TButton;
    DeleteOrderRisk: TButton;
    Label3: TLabel;
    ID2: TEdit;
    LocationsLabel: TLabel;
    GetAllLocations: TButton;
    CountAllLocations: TButton;
    GetSingleLocation: TButton;
    GetAllInventoriesByLocation: TButton;
    GetAllLocationsByInventory: TButton;
    GetSingleInventory: TButton;
    UpdateInventory: TButton;
    ProductsLabel: TLabel;
    GetAllProducts: TButton;
    CountAllProducts: TButton;
    GetSingleProduct: TButton;
    UpdateProduct: TButton;
    PostProduct: TButton;
    DeleteProduct: TButton;
    GetProductFeedback: TButton;
    GetAllProductVariants: TButton;
    CountAllProductVariants: TButton;
    GetSingleProductVariant: TButton;
    PostProductVariant: TButton;
    UpdateProductVariant: TButton;
    DeleteProductVariant: TButton;
    GetAllProductImages: TButton;
    GetSingleProductImage: TButton;
    PostImage: TButton;
    DeleteImage: TButton;
    Label4: TLabel;
    Button1: TButton;
//    procedure TestCallClick(Sender: TObject);
    procedure GetAllClick(Sender: TObject);
    procedure GetSingleClick(Sender: TObject);
    procedure CountAllClick(Sender: TObject);
    procedure PostClick(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure SwitchPlatformClick(Sender: TObject);
    procedure GetAllCustomersClick(Sender: TObject);
    procedure GetSingleCustomerClick(Sender: TObject);
    procedure PostCustomerClick(Sender: TObject);
    procedure UpdateCustomerClick(Sender: TObject);
    procedure DeleteCustomerClick(Sender: TObject);
    procedure GetAllOrdersClick(Sender: TObject);
    procedure CountAllOrdersClick(Sender: TObject);
    procedure GetSingleOrderClick(Sender: TObject);
    procedure UpdateOrderClick(Sender: TObject);
    procedure PostOrderClick(Sender: TObject);
    procedure DeleteOrderClick(Sender: TObject);
    procedure PostOrderCompleteClick(Sender: TObject);
    procedure GetAllOrderFulfillmentsClick(Sender: TObject);
    procedure GetSingleOrderFulfillmentClick(Sender: TObject);
    procedure PostOrderFulfillmentClick(Sender: TObject);
    procedure UpdateOrderFulfillmentClick(Sender: TObject);
    procedure GetAllOrderFulfillmentLocationsClick(Sender: TObject);
    procedure GetAllOrderRisksClick(Sender: TObject);
    procedure GetSingleOrderRiskClick(Sender: TObject);
    procedure PostOrderRiskClick(Sender: TObject);
    procedure DeleteOrderRiskClick(Sender: TObject);
    procedure GetAllLocationsClick(Sender: TObject);
    procedure CountAllLocationsClick(Sender: TObject);
    procedure GetSingleLocationClick(Sender: TObject);
    procedure GetAllInventoriesByLocationClick(Sender: TObject);
    procedure GetAllLocationsByInventoryClick(Sender: TObject);
    procedure GetSingleInventoryClick(Sender: TObject);
    procedure UpdateInventoryClick(Sender: TObject);
    procedure GetAllProductsClick(Sender: TObject);
    procedure CountAllProductsClick(Sender: TObject);
    procedure GetSingleProductClick(Sender: TObject);
    procedure UpdateProductClick(Sender: TObject);
    procedure PostProductClick(Sender: TObject);
    procedure DeleteProductClick(Sender: TObject);
    procedure GetProductFeedbackClick(Sender: TObject);
    procedure GetAllProductVariantsClick(Sender: TObject);
    procedure CountAllProductVariantsClick(Sender: TObject);
    procedure GetSingleProductVariantClick(Sender: TObject);
    procedure PostProductVariantClick(Sender: TObject);
    procedure UpdateProductVariantClick(Sender: TObject);
    procedure DeleteProductVariantClick(Sender: TObject);
    procedure GetAllProductImagesClick(Sender: TObject);
    procedure GetSingleProductImageClick(Sender: TObject);
    procedure PostImageClick(Sender: TObject);
    procedure DeleteImageClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  Form1: TForm1;
  isWooCommerce: Boolean = True;

implementation

{$R *.dfm}


constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
    setWebshopToken();
end;

destructor TForm1.Destroy;
begin
  _EcomConnectContainer.Free;
  inherited;
end;

procedure TForm1.setWebshopToken();
begin
  if(isWooCommerce) THEN
  begin
    // WooCommerce Shop ACCES_TOKEN:
    _EcomConnectContainer := EcomConnectContainer.Create(Ecart_Type,
    'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI5T2xpZ093QWFBb1BWQU9oMXc3bFZJUUdaaGFhbVUwaCIsImlhdCI6MTY5ODkxMTM0NjgyNn0.d1H4uampnaKI02inH86XuaWKfe5QxMjykzfOotv1eENZVlnVczy6G2bfM8bazi-1vomkRoN6sMecdRf1cZtSVg');
    SwitchPlatformLabel.Caption := 'WooCommerce';
  end
  else
  begin
    // Shopify Shop ACCES_TOKEN:
    _EcomConnectContainer := EcomConnectContainer.Create(Ecart_Type,
    'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI5T2xpZ093QWFBb1BWQU9oMXc3bFZJUUdaaGFhbVUwaCIsImlhdCI6MTcwMjU0NTQ4OTAyMH0.TuHsq7_IEeACZwnSjkNT_g34FIudlpJcgr6-9t5C5bW8s2IMnRlbhbQpmHFwDY5yOpBrbcguxDxzGTTruUw69A');
    SwitchPlatformLabel.Caption := 'Shopify';
  end;
  isWooCommerce := not isWooCommerce;
end;



procedure TForm1.SwitchPlatformClick(Sender: TObject);
begin
  setWebshopToken();
end;

//procedure TForm1.TestCallClick(Sender: TObject);
//begin
//  var
//  JsonObject: TJSONValue;
//  begin
//  JsonObject := nil;
//    try
//    JsonObject := _EcomConnectContainer.iPaaS1_Testables.GetAllTestables();
//    Memo1.Lines.Text := JsonObject.ToString;
//    finally
//    JsonObject.Free;
//    end;
//  end;
//end;

procedure TForm1.GetAllClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.GetAllCategories();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.GetSingleCategory(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Form2: TForm2;
begin
  Form2 := TForm2.Create(Application);
  try
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
end;

procedure TForm1.CountAllClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.CountAllCategories();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.PostCategory(CreateCategoryJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.UpdateCategory(StrToInt64(ID1.Text), CreateCategoryJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Categories.DeleteCategory(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllCustomersClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Customers.GetAllCustomers();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleCustomerClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Customers.GetSingleCustomer(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostCustomerClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Customers.PostCustomer(CreateCustomerJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateCustomerClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Customers.UpdateCustomer(StrToInt64(ID1.Text), CreateCustomerJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteCustomerClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Customers.DeleteCustomer(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllOrdersClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetAllOrders();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.CountAllOrdersClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.CountAllOrders();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleOrderClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetSingleOrder(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateOrderClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.UpdateOrder(StrToInt64(ID1.Text), CreateOrderJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostOrderClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.PostOrder(CreateOrderJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteOrderClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.DeleteOrder(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostOrderCompleteClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.PostOrderComplete(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllOrderFulfillmentsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetAllOrderFulfillments(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleOrderFulfillmentClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetSingleOrderFulfillment(StrToInt64(ID1.Text), ID2.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostOrderFulfillmentClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.PostOrderFulfillment(StrToInt64(ID1.Text), CreateFulfillmentJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateOrderFulfillmentClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.UpdateOrderFulfillment(StrToInt64(ID1.Text), ID2.Text);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllOrderFulfillmentLocationsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetAllOrderFulfillmentLocations(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllOrderRisksClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetAllOrderRisks(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleOrderRiskClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.GetSingleOrderRisk(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostOrderRiskClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.PostOrderRisk(StrToInt64(ID1.Text), CreateRiskJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteOrderRiskClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Orders.DeleteOrderRisk(StrToInt64(ID1.Text),  StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllLocationsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.GetAllLocations();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.CountAllLocationsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.CountAllLocations();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleLocationClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.GetSingleLocation(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllInventoriesByLocationClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.GetAllInventoriesByLocation(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllLocationsByInventoryClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.GetAllLocationsByInventory(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleInventoryClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.GetSingleInventory(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateInventoryClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Locations.UpdateInventory(StrToInt64(ID1.Text), StrToInt64(ID2.Text), CreateInventoryJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllProductsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetAllProducts();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.CountAllProductsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.CountAllProducts();
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleProductClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetSingleProduct(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateProductClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.UpdateProduct(StrToInt64(ID1.Text), CreateProductJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostProductClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.PostProduct(CreateProductJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteProductClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.DeleteProduct(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetProductFeedbackClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetProductFeedback(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllProductVariantsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetAllProductVariants(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.CountAllProductVariantsClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.CountAllProductVariants(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleProductVariantClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetSingleProductVariant(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostProductVariantClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.PostProductVariant(StrToInt64(ID1.Text), CreateProductVariantJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.UpdateProductVariantClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.UpdateProductVariant(StrToInt64(ID1.Text), StrToInt64(ID2.Text), CreateProductVariantJsonForUpdate);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteProductVariantClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.DeleteProductVariant(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetAllProductImagesClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetAllProductsImages(StrToInt64(ID1.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.GetSingleProductImageClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.GetSingleProductImage(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.PostImageClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.PostImage(StrToInt64(ID1.Text), CreateProductImageJsonForPost);
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

procedure TForm1.DeleteImageClick(Sender: TObject);
begin
  var
  JsonObject: TJSONValue;
  begin
  JsonObject := nil;
    try
    JsonObject := _EcomConnectContainer.eCart_Products.DeleteImage(StrToInt64(ID1.Text), StrToInt64(ID2.Text));
    Memo1.Lines.Text := JsonObject.ToString;
    finally
    JsonObject.Free;
    end;
  end;
end;

end.
