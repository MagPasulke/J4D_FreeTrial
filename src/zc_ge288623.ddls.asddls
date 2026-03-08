@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: 'Online Shop'
@ObjectModel: {
  sapObjectNodeType.name: 'ZGE288623'
}
@AccessControl.authorizationCheck: #MANDATORY
@Search.searchable: true
@ObjectModel.semanticKey: ['OrderId']
define root view entity ZC_GE288623
  provider contract transactional_query
  as projection on ZR_GE288623
  association [1..1] to ZR_GE288623 as _BaseEntity on $projection.OrderUUID = _BaseEntity.OrderUUID
{
  key OrderUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      OrderID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @Consumption.valueHelpDefinition: [ {
      entity.name: 'ZI_AC_VH_PRODUCTS',
      entity.element: 'Product',
      useForValidation: true
      } ]
      OrderedItem,
      OrderQuantity,
      RequestedDeliveryDate,
      @Semantics: {
        amount.currencyCode: 'Currency'
      }
      TotalPrice,
      @Consumption: {
        valueHelpDefinition: [ {
          entity.element: 'Currency',
          entity.name: 'I_CurrencyStdVH',
          useForValidation: true
        } ]
      }
      Currency,
      OverallStatus,
      SalesOrderStatus,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      Salesorder,
      BgpfStatus,
      BgpgProcessName,
      ManageSalesOrderUrl,
      Notes,
      @Semantics: {
        user.createdBy: true
      }
      CreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      CreatedAt,
      @Semantics: {
        user.lastChangedBy: true
      }
      LastChangedBy,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,
      _BaseEntity
}
