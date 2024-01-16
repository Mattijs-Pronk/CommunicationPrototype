unit ErrorHandler;

interface

uses
   System.SysUtils, System.JSON, Vcl.Dialogs, System.RegularExpressions;

type
  //Interfaces aanmaken.
  IMyErrorHandler = interface
    function ErrorHandlerEcart(ResponseBody: String): TJSONValue;
    function ErrorHandlerApi2Cart(ResponseBody: String): TJSONValue;
  end;

  //Function aanmaken.
  ErrorHandlerClass = class(TInterfacedObject, IMyErrorHandler)
    function ErrorHandlerEcart(ResponseBody: String): TJSONValue;
    function ErrorHandlerApi2Cart(ResponseBody: String): TJSONValue;
  end;


implementation


function ErrorHandlerClass.ErrorHandlerEcart(ResponseBody: String): TJSONValue;
begin
  if ResponseBody.Contains('The resource is not available for this ecommerce') then
  begin
    ShowMessage('The resource is not available for this ecommerce');
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": true, "content": ' + ResponseBody + '}');
  end
  else if ResponseBody.Contains('error') then
  begin
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": true, "content": ' + ResponseBody + '}');
  end
  else
  begin
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": false, "content": ' + ResponseBody + '}');
  end;
end;



function ErrorHandlerClass.ErrorHandlerApi2Cart(ResponseBody: String): TJSONValue;
var
  regex: TRegEx;
begin
  if ResponseBody.Contains('is not supported for this cart yet.') then
  begin
    ShowMessage('The resource is not available for this ecommerce');
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": true, "content": ' + ResponseBody + '}');
  end
  else if not regex.IsMatch(ResponseBody, '"return_code":\s*0\s*,') then
  begin
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": true, "content": ' + ResponseBody + '}');
  end
  else
  begin
    Result := TJSONObject.ParseJSONValue('{"iPaaS_error": false, "content": ' + ResponseBody + '}');
  end;
end;

end.
