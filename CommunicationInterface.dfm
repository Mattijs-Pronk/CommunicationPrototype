object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 753
  ClientWidth = 1118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 453
    Top = 363
    Width = 85
    Height = 23
    Caption = 'Categories'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 238
    Top = 11
    Width = 20
    Height = 15
    Caption = 'ID1:'
  end
  object SwitchPlatformLabel: TLabel
    Left = 586
    Top = 14
    Width = 40
    Height = 23
    Caption = '0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CustomersLabel: TLabel
    Left = 578
    Top = 363
    Width = 84
    Height = 23
    Caption = 'Customers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object OrdersLabel: TLabel
    Left = 300
    Top = 99
    Width = 54
    Height = 23
    Caption = 'Orders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 238
    Top = 40
    Width = 20
    Height = 15
    Caption = 'ID2:'
  end
  object LocationsLabel: TLabel
    Left = 508
    Top = 99
    Width = 75
    Height = 23
    Caption = 'Locations'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object ProductsLabel: TLabel
    Left = 91
    Top = 99
    Width = 70
    Height = 23
    Caption = 'Products'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 8
    Width = 75
    Height = 45
    Caption = 'Ecart'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 704
    Top = 8
    Width = 406
    Height = 737
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object GetAll: TButton
    Left = 457
    Top = 392
    Width = 75
    Height = 25
    Caption = 'GetAll'
    TabOrder = 1
    OnClick = GetAllClick
  end
  object GetSingle: TButton
    Left = 457
    Top = 423
    Width = 75
    Height = 25
    Caption = 'GetSingle'
    TabOrder = 2
    OnClick = GetSingleClick
  end
  object CountAll: TButton
    Left = 457
    Top = 454
    Width = 75
    Height = 25
    Caption = 'CountAll'
    TabOrder = 3
    OnClick = CountAllClick
  end
  object Post: TButton
    Left = 457
    Top = 485
    Width = 75
    Height = 25
    Caption = 'Post'
    TabOrder = 4
    OnClick = PostClick
  end
  object Update: TButton
    Left = 457
    Top = 516
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 5
    OnClick = UpdateClick
  end
  object Delete: TButton
    Left = 457
    Top = 547
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = DeleteClick
  end
  object ID1: TEdit
    Left = 264
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object SwitchPlatform: TButton
    Left = 586
    Top = 43
    Width = 98
    Height = 38
    Caption = 'Switch platform'
    TabOrder = 8
    OnClick = SwitchPlatformClick
  end
  object GetAllCustomers: TButton
    Left = 578
    Top = 392
    Width = 75
    Height = 25
    Caption = 'GetAll'
    TabOrder = 9
    OnClick = GetAllCustomersClick
  end
  object GetSingleCustomer: TButton
    Left = 578
    Top = 423
    Width = 75
    Height = 25
    Caption = 'GetSingle'
    TabOrder = 10
    OnClick = GetSingleCustomerClick
  end
  object PostCustomer: TButton
    Left = 578
    Top = 454
    Width = 75
    Height = 25
    Caption = 'Post'
    TabOrder = 11
    OnClick = PostCustomerClick
  end
  object UpdateCustomer: TButton
    Left = 578
    Top = 485
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 12
    OnClick = UpdateCustomerClick
  end
  object DeleteCustomer: TButton
    Left = 578
    Top = 516
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 13
    OnClick = DeleteCustomerClick
  end
  object GetAllOrders: TButton
    Left = 251
    Top = 128
    Width = 153
    Height = 25
    Caption = 'GetAll'
    TabOrder = 14
    OnClick = GetAllOrdersClick
  end
  object GetSingleOrder: TButton
    Left = 251
    Top = 190
    Width = 153
    Height = 25
    Caption = 'GetSingle'
    TabOrder = 15
    OnClick = GetSingleOrderClick
  end
  object CountAllOrders: TButton
    Left = 251
    Top = 159
    Width = 153
    Height = 25
    Caption = 'CountAll'
    TabOrder = 16
    OnClick = CountAllOrdersClick
  end
  object UpdateOrder: TButton
    Left = 251
    Top = 221
    Width = 153
    Height = 25
    Caption = 'Update'
    TabOrder = 17
    OnClick = UpdateOrderClick
  end
  object PostOrder: TButton
    Left = 251
    Top = 252
    Width = 153
    Height = 25
    Caption = 'Post'
    TabOrder = 18
    OnClick = PostOrderClick
  end
  object DeleteOrder: TButton
    Left = 251
    Top = 283
    Width = 153
    Height = 25
    Caption = 'Delete'
    TabOrder = 19
    OnClick = DeleteOrderClick
  end
  object PostOrderComplete: TButton
    Left = 251
    Top = 314
    Width = 153
    Height = 25
    Caption = 'PostComplete'
    TabOrder = 20
    OnClick = PostOrderCompleteClick
  end
  object GetAllOrderFulfillments: TButton
    Left = 251
    Top = 345
    Width = 153
    Height = 25
    Caption = 'GetAllFulfillments'
    TabOrder = 21
    OnClick = GetAllOrderFulfillmentsClick
  end
  object GetSingleOrderFulfillment: TButton
    Left = 251
    Top = 376
    Width = 153
    Height = 25
    Caption = 'GetSingleFulfillment'
    TabOrder = 22
    OnClick = GetSingleOrderFulfillmentClick
  end
  object PostOrderFulfillment: TButton
    Left = 251
    Top = 407
    Width = 153
    Height = 25
    Caption = 'PostFulfillment'
    TabOrder = 23
    OnClick = PostOrderFulfillmentClick
  end
  object UpdateOrderFulfillment: TButton
    Left = 251
    Top = 438
    Width = 153
    Height = 25
    Caption = 'UpdateFulfillment'
    TabOrder = 24
    OnClick = UpdateOrderFulfillmentClick
  end
  object GetAllOrderFulfillmentLocations: TButton
    Left = 251
    Top = 469
    Width = 153
    Height = 25
    Caption = 'GetAllFulfillmentLocations'
    TabOrder = 25
    OnClick = GetAllOrderFulfillmentLocationsClick
  end
  object GetAllOrderRisks: TButton
    Left = 251
    Top = 500
    Width = 153
    Height = 25
    Caption = 'GetAllRisks'
    TabOrder = 26
    OnClick = GetAllOrderRisksClick
  end
  object GetSingleOrderRisk: TButton
    Left = 251
    Top = 531
    Width = 153
    Height = 25
    Caption = 'GetSingleRisk'
    TabOrder = 27
    OnClick = GetSingleOrderRiskClick
  end
  object PostOrderRisk: TButton
    Left = 251
    Top = 562
    Width = 153
    Height = 25
    Caption = 'PostRisk'
    TabOrder = 28
    OnClick = PostOrderRiskClick
  end
  object DeleteOrderRisk: TButton
    Left = 251
    Top = 593
    Width = 153
    Height = 25
    Caption = 'DeleteRisk'
    TabOrder = 29
    OnClick = DeleteOrderRiskClick
  end
  object ID2: TEdit
    Left = 264
    Top = 37
    Width = 121
    Height = 23
    TabOrder = 30
  end
  object GetAllLocations: TButton
    Left = 468
    Top = 128
    Width = 157
    Height = 25
    Caption = 'GetAll'
    TabOrder = 31
    OnClick = GetAllLocationsClick
  end
  object CountAllLocations: TButton
    Left = 468
    Top = 159
    Width = 157
    Height = 25
    Caption = 'CountAll'
    TabOrder = 32
    OnClick = CountAllLocationsClick
  end
  object GetSingleLocation: TButton
    Left = 468
    Top = 190
    Width = 157
    Height = 25
    Caption = 'GetSingle'
    TabOrder = 33
    OnClick = GetSingleLocationClick
  end
  object GetAllInventoriesByLocation: TButton
    Left = 468
    Top = 221
    Width = 157
    Height = 25
    Caption = 'GetAllInventoriesByLocation'
    TabOrder = 34
    OnClick = GetAllInventoriesByLocationClick
  end
  object GetAllLocationsByInventory: TButton
    Left = 468
    Top = 252
    Width = 157
    Height = 25
    Caption = 'GetAllLocationsByInventory'
    TabOrder = 35
    OnClick = GetAllLocationsByInventoryClick
  end
  object GetSingleInventory: TButton
    Left = 468
    Top = 283
    Width = 157
    Height = 25
    Caption = 'GetSingleInventory'
    TabOrder = 36
    OnClick = GetSingleInventoryClick
  end
  object UpdateInventory: TButton
    Left = 468
    Top = 314
    Width = 157
    Height = 25
    Caption = 'UpdateInventory'
    TabOrder = 37
    OnClick = UpdateInventoryClick
  end
  object GetAllProducts: TButton
    Left = 88
    Top = 128
    Width = 97
    Height = 25
    Caption = 'GetAll'
    TabOrder = 38
    OnClick = GetAllProductsClick
  end
  object CountAllProducts: TButton
    Left = 88
    Top = 159
    Width = 97
    Height = 25
    Caption = 'CountAll'
    TabOrder = 39
    OnClick = CountAllProductsClick
  end
  object GetSingleProduct: TButton
    Left = 88
    Top = 190
    Width = 97
    Height = 25
    Caption = 'GetSingle'
    TabOrder = 40
    OnClick = GetSingleProductClick
  end
  object UpdateProduct: TButton
    Left = 88
    Top = 221
    Width = 97
    Height = 25
    Caption = 'Update'
    TabOrder = 41
    OnClick = UpdateProductClick
  end
  object PostProduct: TButton
    Left = 88
    Top = 252
    Width = 97
    Height = 25
    Caption = 'Post'
    TabOrder = 42
    OnClick = PostProductClick
  end
  object DeleteProduct: TButton
    Left = 88
    Top = 283
    Width = 97
    Height = 25
    Caption = 'Delete'
    TabOrder = 43
    OnClick = DeleteProductClick
  end
  object GetProductFeedback: TButton
    Left = 88
    Top = 314
    Width = 97
    Height = 25
    Caption = 'GetFeedback'
    TabOrder = 44
    OnClick = GetProductFeedbackClick
  end
  object GetAllProductVariants: TButton
    Left = 88
    Top = 345
    Width = 97
    Height = 25
    Caption = 'GetAllVariants'
    TabOrder = 45
    OnClick = GetAllProductVariantsClick
  end
  object CountAllProductVariants: TButton
    Left = 88
    Top = 376
    Width = 97
    Height = 25
    Caption = 'CountAllVariants'
    TabOrder = 46
    OnClick = CountAllProductVariantsClick
  end
  object GetSingleProductVariant: TButton
    Left = 88
    Top = 407
    Width = 97
    Height = 25
    Caption = 'GetSingleVariant'
    TabOrder = 47
    OnClick = GetSingleProductVariantClick
  end
  object PostProductVariant: TButton
    Left = 88
    Top = 438
    Width = 97
    Height = 25
    Caption = 'PostVariant'
    TabOrder = 48
    OnClick = PostProductVariantClick
  end
  object UpdateProductVariant: TButton
    Left = 88
    Top = 469
    Width = 97
    Height = 25
    Caption = 'UpdateVariant'
    TabOrder = 49
    OnClick = UpdateProductVariantClick
  end
  object DeleteProductVariant: TButton
    Left = 88
    Top = 500
    Width = 97
    Height = 25
    Caption = 'DeleteVariant'
    TabOrder = 50
    OnClick = DeleteProductVariantClick
  end
  object GetAllProductImages: TButton
    Left = 88
    Top = 531
    Width = 97
    Height = 25
    Caption = 'GetAllImages'
    TabOrder = 51
    OnClick = GetAllProductImagesClick
  end
  object GetSingleProductImage: TButton
    Left = 88
    Top = 562
    Width = 97
    Height = 25
    Caption = 'GetSingleImage'
    TabOrder = 52
    OnClick = GetSingleProductImageClick
  end
  object PostImage: TButton
    Left = 88
    Top = 593
    Width = 97
    Height = 25
    Caption = 'PostImage'
    TabOrder = 53
    OnClick = PostImageClick
  end
  object DeleteImage: TButton
    Left = 88
    Top = 624
    Width = 97
    Height = 25
    Caption = 'DeleteImage'
    TabOrder = 54
    OnClick = DeleteImageClick
  end
  object Button1: TButton
    Left = 560
    Top = 696
    Width = 138
    Height = 49
    Caption = 'Api2Cart'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 55
    OnClick = Button1Click
  end
end
