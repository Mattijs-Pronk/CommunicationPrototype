unit JsonFiles;

interface

uses
  System.JSON;

//EcartApi
function CreateProductJsonForUpdate: TJSONObject;
function CreateProductJsonForPost: TJSONObject;
function CreateProductVariantJsonForUpdate: TJSONObject;
function CreateProductVariantJsonForPost: TJSONObject;
function CreateOrderJsonForPost: TJSONObject;
function CreateOrderJsonForUpdate: TJSONObject;
function CreateFulfillmentJsonForPost: TJSONObject;
function CreateRiskJsonForPost: TJSONObject;
function CreateVariantJson: TJSONObject;
function CreateCategoryJsonForPost: TJSONObject;
function CreateCategoryJsonForUpdate: TJSONObject;
function CreateCustomerJsonForPost: TJSONObject;
function CreateCustomerJsonForUpdate: TJSONObject;
function CreateShippingZoneJsonForPost: TJSONObject;
function CreateShippingZoneJsonForUpdate: TJSONObject;
function CreateShippingMethodJsonForPost: TJSONObject;
function CreateShippingMethodJsonForUpdate: TJSONObject;
function CreateShippingZoneLocationJsonForUpdate: TJSONObject;
function CreateInventoryJsonForUpdate: TJSONObject;
function CreateProductImageJsonForPost: TJSONObject;

//Api2Cart
function CreateFindProductJson: TJSONObject;
function CreateNewProductImageJson: TJSONObject;
function CreateNewProductJson: TJSONObject;
function CreateUpdateProductJson: TJSONObject;
function CreateNewProductVariantAddJson: TJSONObject;
function CreateNewProductVariantUpdateJson: TJSONObject;
function CreateNewProductOptionAddJson: TJSONObject;
function CreateNewProductAttributeSetJson: TJSONObject;
function CreateFindCategoryJson: TJSONObject;
function CreateAddCategoryJson: TJSONObject;
function CreateUpdateCategoryJson: TJSONObject;

implementation

function CreateProductJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('product',
        TJSONObject.Create
          .AddPair('name', 'Earpods Update 222222222')
          .AddPair('sku', 'SKU1')
          .AddPair('price', '100')
          .AddPair('description', 'It''s the small iMac with a big idea: Video.')
          .AddPair('productType', 'simple')
          .AddPair(
            'status',
            TJSONObject.Create
              .AddPair('visibility', 'visible')
          )
          .AddPair('quantity', '10')
          .AddPair('requireShipping', 'true')
          .AddPair(
            'dimensions',
            TJSONObject.Create
              .AddPair('weight', '1')
              .AddPair('length', '1')
              .AddPair('width', '2')
              .AddPair('height', '1')
          )
          .AddPair('options',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('name', 'option1')
                  .AddPair('values',
                    TJSONArray.Create
                      .Add('green')
                      .Add('red')
                  )
              )
          )
      );
end;

function CreateProductJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('product',
        TJSONObject.Create
          .AddPair('name', 'Test dev Product 12')
          .AddPair('sku', '123456')
          .AddPair('description', 'Short description')
          .AddPair('productType', 'variable')
          .AddPair('quantity', '18')
          .AddPair('price', '37,95')
          .AddPair(
            'status',
            TJSONObject.Create
              .AddPair('visibility', 'visible')
              .AddPair('status', 'publish')
          )
          .AddPair(
            'categories',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('id', '17')
              )
          )
          .AddPair(
            'tags',
            TJSONArray.Create
              .Add('18')
          )
          .AddPair(
            'options',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('id', '1')
                  .AddPair('name', 'Color')
                  .AddPair(
                    'values',
                    TJSONArray.Create
                      .Add('Blue')
                      .Add('Red')
                  )
              )
              .Add(
                TJSONObject.Create
                  .AddPair('id', '2')
                  .AddPair('name', 'Size')
                  .AddPair(
                    'values',
                    TJSONArray.Create
                      .Add('S')
                      .Add('M')
                  )
              )
          )
          .AddPair(
            'images',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('image', 'http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg')
              )
          )
          .AddPair(
            'dimensions',
            TJSONObject.Create
              .AddPair('weight', '1')
              .AddPair('length', '10')
              .AddPair('width', '10')
              .AddPair('height', '10')
          )
      );
end;

function CreateProductVariantJsonForPost: TJSONObject;
var
  optionsArray, imagesArray: TJSONArray;
begin
  optionsArray := TJSONArray.Create;
  optionsArray.AddElement(TJSONObject.Create
    .AddPair('id', '1')
    .AddPair('value', 'Purple')
  );
  optionsArray.AddElement(TJSONObject.Create
    .AddPair('id', '2')
    .AddPair('value', 'S')
  );

  imagesArray := TJSONArray.Create;
  imagesArray.AddElement(TJSONObject.Create
    .AddPair('src', 'https://www.wallpapergeeks.com/wp-content/uploads/2014/03/Nature_107.jpg')
  );

  Result := TJSONObject.Create
    .AddPair('variant', TJSONObject.Create
      .AddPair('name', 'variant test')
      .AddPair('price', '11')
      .AddPair('sku', 'A1467889')
      .AddPair('options', optionsArray)
      .AddPair('images', imagesArray)
    );
end;


function CreateProductVariantJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('variant',
        TJSONObject.Create
          .AddPair('price', '10400')
          .AddPair('sku', 'SKU11Grey2')
          .AddPair('name', 'Broodje')
          .AddPair('weight', '1')
          .AddPair('dimensions',
            TJSONObject.Create
              .AddPair('weight', '1')
          )
          .AddPair('inventory',
            TJSONObject.Create
              .AddPair('quantity', '110000')
          )
      );
end;

function CreateOrderJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('order',
        TJSONObject.Create
          .AddPair('billingAddress',
            TJSONObject.Create
              .AddPair('address1', '123 Fake Street')
              .AddPair('city', 'Fakecity')
              .AddPair('company', 'envia.com')
              .AddPair('country',
                TJSONObject.Create
                  .AddPair('code', 'CA')
                  .AddPair('name', 'Canada')
              )
              .AddPair('firstName', 'Pipo')
              .AddPair('lastName', 'Joehoe')
              .AddPair('phone', '555-555-5555')
              .AddPair('postalCode', 'K2P 1L4')
              .AddPair('state',
                TJSONObject.Create
                  .AddPair('code', 'ON')
                  .AddPair('name', 'Ontario')
              )
          )
          .AddPair('payment',
            TJSONObject.Create
              .AddPair('method', 'Daniela test')
          )
          .AddPair('currency', 'MXN')
          .AddPair('items',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('discount', '0')
                  .AddPair('quantity', '10')
                  .AddPair('sku', 'SKU1')
                  .AddPair('taxable', 'false')
                  .AddPair('variantId', '45')
              )
              .Add(
                TJSONObject.Create
                  .AddPair('discount', '0')
                  .AddPair('quantity', '311')
                  .AddPair('sku', 'SKU1')
                  .AddPair('taxable', 'false')
                  .AddPair('variantId', '46')
              )
              .Add(
                TJSONObject.Create
                  .AddPair('discount', '0')
                  .AddPair('quantity', '72')
                  .AddPair('sku', 'SKU1')
                  .AddPair('taxable', 'false')
                  .AddPair('variantId', '47')
              )
          )
          .AddPair('shippingAddress',
            TJSONObject.Create
              .AddPair('address1', '123 Fake Street')
              .AddPair('city', 'Fakecity')
              .AddPair('company', 'envia.com')
              .AddPair('country',
                TJSONObject.Create
                  .AddPair('code', 'CA')
                  .AddPair('name', 'Canada')
              )
              .AddPair('firstName', 'John')
              .AddPair('lastName', 'Silver')
              .AddPair('phone', '555-555-5555')
              .AddPair('postalCode', 'K2P 1L4')
              .AddPair('state',
                TJSONObject.Create
                  .AddPair('code', 'ON')
                  .AddPair('name', 'Ontario')
              )
          )
          .AddPair('status',
            TJSONObject.Create
              .AddPair('status', 'pending')
          )
          .AddPair('tags',
            TJSONArray.Create
              .Add('imported')
          )
          .AddPair('taxesIncluded', 'false')
          .AddPair('totals',
            TJSONObject.Create
              .AddPair('discount', '0')
              .AddPair('subtotal', '39.95')
              .AddPair('tax', '0.00')
              .AddPair('total', '39.95')
              .AddPair('weight', '5')
          )
          .AddPair('note', 'New note')
      );
end;

function CreateOrderJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('order',
        TJSONObject.Create
          .AddPair('billingAddress',
            TJSONObject.Create
              .AddPair('address1', '123 Fake Street')
              .AddPair('city', 'Fakecity')
              .AddPair('company', 'envia.com')
              .AddPair('country',
                TJSONObject.Create
                  .AddPair('code', 'CA')
                  .AddPair('name', 'Canada')
              )
              .AddPair('firstName', 'Kwik')
              .AddPair('lastName', 'Kwek')
              .AddPair('phone', '555-555-5555')
              .AddPair('postalCode', 'K2P 1L4')
              .AddPair('state',
                TJSONObject.Create
                  .AddPair('code', 'ON')
                  .AddPair('name', 'Ontario')
              )
          )
          .AddPair('payment',
            TJSONObject.Create
              .AddPair('method', 'Daniela test')
          )
          .AddPair('currency', 'MXN')
          .AddPair('items',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('discount', '0')
                  .AddPair('quantity', '10000')
                .AddPair('sku', 'SKU1')
                  .AddPair('taxable', 'false')
                  .AddPair('variantId', '46')
              )
          )
          .AddPair('shippingAddress',
            TJSONObject.Create
              .AddPair('address1', '123 Fake Street')
              .AddPair('city', 'Fakecity')
              .AddPair('company', 'envia.com')
              .AddPair('country',
                TJSONObject.Create
                  .AddPair('code', 'CA')
                  .AddPair('name', 'Canada')
              )
              .AddPair('firstName', 'John')
              .AddPair('lastName', 'Silver')
              .AddPair('phone', '555-555-5555')
              .AddPair('postalCode', 'K2P 1L4')
              .AddPair('state',
                TJSONObject.Create
                  .AddPair('code', 'ON')
                  .AddPair('name', 'Ontario')
              )
          )
          .AddPair('status',
            TJSONObject.Create
              .AddPair('status', 'pending')
          )
          .AddPair('tags',
            TJSONArray.Create
              .Add('imported')
          )
          .AddPair('taxesIncluded', 'false')
          .AddPair('totals',
            TJSONObject.Create
              .AddPair('discount', '10.00')
              .AddPair('subtotal', '29.95')
              .AddPair('tax', '0.00')
              .AddPair('total', '29.95')
              .AddPair('weight', '5')
          )
          .AddPair('note', 'New note')
      );
end;

function CreateFulfillmentJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('fulfillment',
        TJSONObject.Create
          .AddPair('shippingMethod', 'Name')
          .AddPair('tracking',
            TJSONObject.Create
              .AddPair('number', '987654321')
              .AddPair('company', 'TestCompany')
              .AddPair('url', 'https://shipping.xyz/track.php?num=123456789')
          )
      );
end;

function CreateVariantJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('variant',
        TJSONObject.Create
          .AddPair('name', 'variant test')
          .AddPair('price', '110')
          .AddPair('sku', 'SKU11Grey')
          .AddPair('options',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('id', '1')
                  .AddPair('value', 'Grey')
              )
              .Add(
                TJSONObject.Create
                  .AddPair('id', '2')
                  .AddPair('value', 'S')
              )
          )
          .AddPair('images',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('src', 'https://www.wallpapergeeks.com/wp-content/uploads/2014/03/Nature_107.jpg')
              )
          )
      );
end;

function CreateCategoryJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('category',
        TJSONObject.Create
          .AddPair('name', 'Sweater')
          .AddPair('description', 'Mostly sweaters')
      );
end;

function CreateCategoryJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('category',
        TJSONObject.Create
          .AddPair('name', 'test123 updated')
      );
end;

function CreateCustomerJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('customer',
        TJSONObject.Create
          .AddPair('email', 'test123@envia.com')
          .AddPair('firstName', 'Pietje')
          .AddPair('lastName', 'Puk')
          .AddPair('addresses',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('firstName', 'Pietje')
                  .AddPair('lastName', 'Puk')
                  .AddPair('address1', '763 Cardinal Lane')
                  .AddPair('address2', 'Murrells Inlet')
                  .AddPair('country',
                    TJSONObject.Create
                      .AddPair('code', 'US')
                  )
                  .AddPair('state',
                    TJSONObject.Create
                      .AddPair('code', 'CA')
                  )
                  .AddPair('city', 'Louisville')
                  .AddPair('phone', '555-625-1199')
                  .AddPair('company', 'envia.com')
                  .AddPair('defaultBilling', 'true')
                  .AddPair('defaultShipping', 'false')
              )
          )
      );
end;

function CreateCustomerJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('customer',
        TJSONObject.Create
          .AddPair('email', 'Jantje@gmail.com')
          .AddPair('firstName', 'Jantje')
          .AddPair('lastName', 'Beton')
          .AddPair('addresses',
            TJSONArray.Create
              .Add(
                TJSONObject.Create
                  .AddPair('firstName', 'Alex')
                  .AddPair('lastName', 'de la Cruz')
                  .AddPair('address1', 'Av Vazconcelos 1400')
                  .AddPair('address2', 'Palo Blanco')
                  .AddPair('country',
                    TJSONObject.Create
                      .AddPair('code', 'MX')
                  )
                  .AddPair('state',
                    TJSONObject.Create
                      .AddPair('code', 'NL')
                  )
                  .AddPair('city', 'Monterrey')
                  .AddPair('postalcode', '40202')
                  .AddPair('phone', '555-625-1199')
                  .AddPair('company', 'envia.com')
                  .AddPair('defaultBilling', 'true')
                  .AddPair('defaultShipping', 'false')
              )
          )
      );
end;

function CreateShippingZoneJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('zone',
        TJSONObject.Create
          .AddPair('name', 'Frankrijk')
          .AddPair('order', '0')
      );
end;

function CreateShippingZoneJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('zone',
        TJSONObject.Create
          .AddPair('name', 'Duitsland')
          .AddPair('order', '10')
      );
end;

function CreateShippingMethodJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('method',
        TJSONObject.Create
          .AddPair('methodId', 'local_pickup')
      );
end;

function CreateShippingMethodJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('method',
        TJSONObject.Create
          .AddPair('order', '10')
          .AddPair('enabled', 'false')
          .AddPair('methodId', 'local_pickup')
      );
end;

function CreateShippingZoneLocationJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('location',
        TJSONArray.Create
          .Add(
            TJSONObject.Create
              .AddPair('code', 'FR')
              .AddPair('type', 'country')
          )
          .Add(
            TJSONObject.Create
              .AddPair('code', 'NL')
              .AddPair('type', 'country')
          )
          .Add(
            TJSONObject.Create
              .AddPair('code', 'DE')
              .AddPair('type', 'country')
          )
      );
end;

function CreateRiskJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('risk',
        TJSONObject.Create
          .AddPair('message', 'This order came from an anonymous proxy')
          .AddPair('recommendation', 'investigate')
          .AddPair('score', '1')
          .AddPair('source', 'External')
      );
end;

function CreateInventoryJsonForUpdate: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('inventory',
        TJSONObject.Create
          .AddPair('available', '2')
      );
end;

function CreateProductImageJsonForPost: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('image',
        TJSONObject.Create
          .AddPair('filename', 'testimage')
          .AddPair('content', 'testimage')
      );
end;

function CreateNewProductJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('name', 'testProductApi2Cart')
      .AddPair('model', 'testProductApi2Cart')
      .AddPair('description', 'testProductApi2Cart')
      .AddPair('price', '99.99')
      .AddPair('quantity', '999999');
end;

function CreateUpdateProductJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('price', '1.00')
      .AddPair('quantity', '1');
end;

function CreateFindProductJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('find_value', '123')
      .AddPair('find_where', 'name')
      .AddPair('find_param', 'whole_words')
      .AddPair('find_what', 'product');
end;

function CreateNewProductImageJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('image_name', 'testimage.png')
      .AddPair('url', 'https://www.google.com/images/srpr/logo1w.png')
      .AddPair('type', 'additional');
end;

function CreateNewProductVariantAddJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('model', 'SKU2024')
      .AddPair('name', 'Green')
      .AddPair('weight', '11')
      .AddPair('quantity', '12')
      .AddPair('attributes[Color][Green]', '13');
end;

function CreateNewProductVariantUpdateJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('sku', 'SKU2025')
      .AddPair('price', '999')
      .AddPair('quantity', '999');
end;

function CreateNewProductOptionAddJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('name', 'Size')
      .AddPair('default_option_value', 'XL');
end;

function CreateNewProductAttributeSetJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('attribute_name', 'Color')
      .AddPair('value', 'Blue');
end;

function CreateFindCategoryJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('find_value', 'test')
      .AddPair('find_where', 'name')
      .AddPair('find_param', 'whole_words')
end;

function CreateAddCategoryJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('name', 'test')
      .AddPair('description', 'test category description')
      .AddPair('meta_title', 'Appliances')
      .AddPair('meta_description', 'technology,hardware,software')
end;

function CreateUpdateCategoryJson: TJSONObject;
begin
  Result :=
    TJSONObject.Create
      .AddPair('name', 'NEW Desktop')
      .AddPair('description', 'NEW Desktop PC ')
      .AddPair('meta_keywords', 'new,category')
      .AddPair('meta_description', 'technology,hardware,software')
end;


end.

