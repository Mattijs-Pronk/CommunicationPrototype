program CommunicationLayerPrototype;

uses
  Vcl.Forms,
  CommunicationInterface in 'CommunicationInterface.pas' {Form1},
  Api2Cart.InterfaceCollection in 'DataLayer\Api2Cart\Api2Cart.InterfaceCollection.pas',
  EcomConnect in 'DataLayer\EcomConnect.pas',
  ErrorHandler in 'DataLayer\ErrorHandler.pas',
  ConfigurationManager in 'DataLayer\ConfigurationManager.pas',
  Ecart.Categories in 'DataLayer\Ecart\EcartControllers\Ecart.Categories.pas',
  Ecart.InterfaceCollection in 'DataLayer\Ecart\Ecart.InterfaceCollection.pas',
  JsonFiles in 'JsonFiles.pas',
  Ecart.Coupons in 'DataLayer\Ecart\EcartControllers\Ecart.Coupons.pas',
  Ecart.Customers in 'DataLayer\Ecart\EcartControllers\Ecart.Customers.pas',
  Ecart.Orders in 'DataLayer\Ecart\EcartControllers\Ecart.Orders.pas',
  Ecart.Products in 'DataLayer\Ecart\EcartControllers\Ecart.Products.pas',
  Ecart.Shippings in 'DataLayer\Ecart\EcartControllers\Ecart.Shippings.pas',
  Ecart.Locations in 'DataLayer\Ecart\EcartControllers\Ecart.Locations.pas',
  Api2CartInterface in 'Api2CartInterface.pas' {Form2},
  Api2Cart.Products in 'DataLayer\Api2Cart\Api2CartControllers\Api2Cart.Products.pas',
  Api2Cart.Categories in 'DataLayer\Api2Cart\Api2CartControllers\Api2Cart.Categories.pas',
  FindProductModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\FindProductModal.pas',
  AddProductModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\AddProductModal.pas',
  UpdateProductModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\UpdateProductModal.pas',
  AddProductImageModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\AddProductImageModal.pas',
  AddProductVariantModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\AddProductVariantModal.pas',
  UpdateProductVariantModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\UpdateProductVariantModal.pas',
  AddProductOptionModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\AddProductOptionModal.pas',
  AddProductAttributeValueModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\AddProductAttributeValueModal.pas',
  FindCategoryModal in 'DataLayer\Api2Cart\Api2CartModals\CategoriesModals\FindCategoryModal.pas',
  AddCategoryModal in 'DataLayer\Api2Cart\Api2CartModals\CategoriesModals\AddCategoryModal.pas',
  UpdateCategoryModal in 'DataLayer\Api2Cart\Api2CartModals\CategoriesModals\UpdateCategoryModal.pas',
  ProductReturnModal in 'DataLayer\Api2Cart\Api2CartModals\ProductsModals\ProductReturnModal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
