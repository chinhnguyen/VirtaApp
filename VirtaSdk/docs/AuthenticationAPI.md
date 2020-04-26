# AuthenticationAPI

All URIs are relative to *https://apitest.virta.fi/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**dELETEAuth**](AuthenticationAPI.md#deleteauth) | **DELETE** /auth | 
[**pOSTAuth**](AuthenticationAPI.md#postauth) | **POST** /auth | /auth


# **dELETEAuth**
```swift
    open class func dELETEAuth(completion: @escaping (_ data: InlineResponse2001?, _ error: Error?) -> Void)
```



Endpoint to invalidate/ revoke a token

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VirtaSdk


AuthenticationAPI.dELETEAuth() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pOSTAuth**
```swift
    open class func pOSTAuth(contentType: String? = nil, brand: String? = nil, brand2: String? = nil, body: InlineObject? = nil, completion: @escaping (_ data: InlineResponse200?, _ error: Error?) -> Void)
```

/auth

The Auth endpoint is used to authenticate the end-user with the system to ensure in their identity. The Auth endpoint issues an unique expiring JWT token to verify the identity for future API requests.  This call will update customer's last_token_generated timestamp.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VirtaSdk

let contentType = "contentType_example" // String |  (optional)
let brand = "brand_example" // String |  (optional)
let brand2 = "brand2_example" // String |  (optional)
let body = inline_object(email: "email_example", code: "code_example") // InlineObject |  (optional)

// /auth
AuthenticationAPI.pOSTAuth(contentType: contentType, brand: brand, brand2: brand2, body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contentType** | **String** |  | [optional] 
 **brand** | **String** |  | [optional] 
 **brand2** | **String** |  | [optional] 
 **body** | [**InlineObject**](InlineObject.md) |  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

