# EVSE

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int** |  | [optional] 
**connectors** | [Connector] |  | [optional] 
**available** | **Bool** | Whether this EVSE is available for usage | [optional] 
**reservable** | **Bool** | Whether this EVSE is available for reservation | [optional] 
**pricing** | [Pricing] |  | [optional] 
**oneTimePayment** | **Bool** | Currently GET stations/{id} uses this field. Won&#39;t be added in that endpoint for Hubject stations. | [optional] 
**status** | **Int** |  | [optional] 
**minutesWithoutTimeCharge** | **Int** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


