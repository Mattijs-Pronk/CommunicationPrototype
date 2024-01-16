unit Api2Cart.InterfaceCollection;

interface

uses
  System.JSON, TListCollection;

type
  {$M+}

  //categorie interface
  IMyCategories = interface
    function Category_List(param: String): TJSONValue;
    function Category_Count(): TJSONValue;
    function Categorie_Info(categoryId: UInt64; param: String): TJSONValue;
    function Categorie_Find(CreateFindCategoryJson: TJSONObject) : TJSONValue;
    function Categorie_Add(CreateAddCategoryJson: TJSONObject): TJSONValue;
    function Categorie_Update(categoryId: UInt64; CreateUpdateCategoryJson: TJSONObject): TJSONValue;
  end;

  //customer interface
  IMyCustomers = interface

  end;

  //order interface
  IMyOrders = interface

  end;

  //products interface
  IMyProducts = interface
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

end.