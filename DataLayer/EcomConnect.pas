unit EcomConnect;

interface

uses
  //interfaces
  Ecart.InterfaceCollection, Api2Cart.InterfaceCollection,
  //controllers
  Ecart.Categories, Ecart.Customers, Ecart.Orders, Ecart.Products, Ecart.Shippings, Ecart.Locations,
  Api2Cart.Products, Api2Cart.Categories;

type
  TApiType = (Api2Cart_Type, Ecart_Type);

  EcomConnectContainer = class(TInterfacedObject)
  private

    //Api2Cart interfaces
    api2Cart_IProducts: Api2Cart.InterfaceCollection.IMyProducts;
    api2Cart_ICategories: Api2Cart.InterfaceCollection.IMyCategories;

    //Ecart interfaces
    eCart_ICategories: Ecart.InterfaceCollection.IMyCategories;
    eCart_ICustomers: Ecart.InterfaceCollection.IMyCustomers;
    eCart_IOrders: Ecart.InterfaceCollection.IMyOrders;
    eCart_IProducts: Ecart.InterfaceCollection.IMyProducts;
    eCart_IShippings: Ecart.InterfaceCollection.IMyShippings;
    eCart_ILocations: Ecart.InterfaceCollection.IMyLocations;

  public
    constructor Create(ApiType: TApiType; ACCES_TOKEN: String);
    destructor Destroy(); override;

    procedure createApi2CartInterfaces(ACCES_TOKEN: String);
    procedure createEcartApiInterfaces(ACCES_TOKEN: String);
    procedure destroyAllInterfaces();

    //Api2Cart interfaces
    Property api2Cart_Products: Api2Cart.InterfaceCollection.IMyProducts read api2Cart_IProducts;
    Property api2Cart_Categories: Api2Cart.InterfaceCollection.IMyCategories read api2Cart_ICategories;

    //Ecart interfaces
    property eCart_Categories: Ecart.InterfaceCollection.IMyCategories read eCart_ICategories;
    property eCart_Customers: Ecart.InterfaceCollection.IMyCustomers read eCart_ICustomers;
    property eCart_Orders: Ecart.InterfaceCollection.IMyOrders read eCart_IOrders;
    property eCart_Products: Ecart.InterfaceCollection.IMyProducts read eCart_IProducts;
    property eCart_Shippings: Ecart.InterfaceCollection.IMyShippings read eCart_IShippings;
    property eCart_Locations: Ecart.InterfaceCollection.IMyLocations read eCart_ILocations;
  end;


implementation


constructor EcomConnectContainer.Create(ApiType: TApiType; ACCES_TOKEN: String);
begin
  case ApiType of
    Api2Cart_Type:
      createApi2CartInterfaces(ACCES_TOKEN);

    Ecart_Type:
      createEcartApiInterfaces(ACCES_TOKEN);
  end;
end;

destructor EcomConnectContainer.Destroy();
begin
  destroyAllInterfaces();
end;


procedure EcomConnectContainer.createApi2CartInterfaces(ACCES_TOKEN: String);
begin
    api2Cart_IProducts := Api2Cart.Products.ProductsController.Create(ACCES_TOKEN);
    api2Cart_ICategories := Api2Cart.Categories.ProductsController.Create(ACCES_TOKEN);
end;

procedure EcomConnectContainer.createEcartApiInterfaces(ACCES_TOKEN: String);
begin
  ecart_ICategories := Ecart.Categories.CategoriesController.Create(ACCES_TOKEN);
  eCart_ICustomers := Ecart.Customers.CustomersController.Create(ACCES_TOKEN);
  eCart_IOrders := Ecart.Orders.OrdersController.Create(ACCES_TOKEN);
  eCart_IProducts := Ecart.Products.ProductsController.Create(ACCES_TOKEN);
  eCart_IShippings := Ecart.Shippings.ShippingsController.Create(ACCES_TOKEN);
  eCart_ILocations := Ecart.Locations.LocationsController.Create(ACCES_TOKEN);
end;

procedure EcomConnectContainer.destroyAllInterfaces();
begin
  api2Cart_IProducts := nil;

  ecart_ICategories := nil;
  eCart_ICustomers := nil;
  eCart_IOrders := nil;
  eCart_IProducts := nil;
  eCart_IShippings := nil;
  eCart_ILocations := nil;
end;

end.
