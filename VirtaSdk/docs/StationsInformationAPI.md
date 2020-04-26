# StationsInformationAPI

All URIs are relative to *https://apitest.virta.fi/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**gETStations**](StationsInformationAPI.md#getstations) | **GET** /stations | /stations
[**gETStationsId**](StationsInformationAPI.md#getstationsid) | **GET** /stations/{id} | /stations/{id}


# **gETStations**
```swift
    open class func gETStations(lastUpdate: String? = nil, latMin: Double? = nil, latMax: Double? = nil, longMin: Double? = nil, longMax: Double? = nil, from: Int? = nil, limit: Int? = nil, privilegedStations: Int? = nil, includePoi: Int? = nil, completion: @escaping (_ data: [BasicStationInfo]?, _ error: Error?) -> Void)
```

/stations

Function to retrieve basic information of all stations regardless of networks (Virta, Hubject, etc.).  If the auhorization header is defined, this function will also return private stations that are visible to that customer account.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VirtaSdk

let lastUpdate = "lastUpdate_example" // String |  (optional)
let latMin = 987 // Double |  (optional)
let latMax = 987 // Double |  (optional)
let longMin = 987 // Double |  (optional)
let longMax = 987 // Double |  (optional)
let from = 987 // Int |  (optional)
let limit = 987 // Int |  (optional)
let privilegedStations = 987 // Int | 0/1 or omitted (optional)
let includePoi = 987 // Int | 0/1 (optional)

// /stations
StationsInformationAPI.gETStations(lastUpdate: lastUpdate, latMin: latMin, latMax: latMax, longMin: longMin, longMax: longMax, from: from, limit: limit, privilegedStations: privilegedStations, includePoi: includePoi) { (response, error) in
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
 **lastUpdate** | **String** |  | [optional] 
 **latMin** | **Double** |  | [optional] 
 **latMax** | **Double** |  | [optional] 
 **longMin** | **Double** |  | [optional] 
 **longMax** | **Double** |  | [optional] 
 **from** | **Int** |  | [optional] 
 **limit** | **Int** |  | [optional] 
 **privilegedStations** | **Int** | 0/1 or omitted | [optional] 
 **includePoi** | **Int** | 0/1 | [optional] 

### Return type

[**[BasicStationInfo]**](BasicStationInfo.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gETStationsId**
```swift
    open class func gETStationsId(id: Int, provider: String? = nil, completion: @escaping (_ data: Station?, _ error: Error?) -> Void)
```

/stations/{id}

Function to retrieve all information the station with specific `stationId`.  If the authorization header is defined, this function will return station's pricing according to that customer account. Otherwise, it will return public pricing if available.

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VirtaSdk

let id = 987 // Int | 
let provider = "provider_example" // String | The station id's can overlap, so we can define the database table that we try to fetch the data. Values are Hubject/Poi/Virta or omitted which will try to fetch from Virta and then Hubject (optional)

// /stations/{id}
StationsInformationAPI.gETStationsId(id: id, provider: provider) { (response, error) in
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
 **id** | **Int** |  | 
 **provider** | **String** | The station id&#39;s can overlap, so we can define the database table that we try to fetch the data. Values are Hubject/Poi/Virta or omitted which will try to fetch from Virta and then Hubject | [optional] 

### Return type

[**Station**](Station.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

