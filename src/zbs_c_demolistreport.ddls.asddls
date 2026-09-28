@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Demo List Report'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZBS_DemoList'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZBS_C_DemoListReport
  provider contract transactional_query
  as projection on ZBS_R_DemoListReport
  association [1..1] to ZBS_R_DemoListReport as _BaseEntity on $projection.KeyValue = _BaseEntity.KeyValue
{
  key KeyValue,
      Description,
      @Consumption.filter.mandatory: true
      @Consumption.filter.selectionType: #SINGLE
      DocType,
      DocDescription,
      @Semantics: {
        amount.currencyCode: 'Currency'
      }
      Amount,
      @Consumption: {
        valueHelpDefinition: [ {
          entity.element: 'Currency',
          entity.name: 'I_CurrencyStdVH',
          useForValidation: true
        } ]
      }
      Currency,
      SellInfo,
      Persons,
      @Consumption.filter.defaultValue: 'X'
      ValidatedEntry,
      @Semantics: {
        user.createdBy: true
      }
      LocalCreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      LocalCreatedAt,
      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt,
      _BaseEntity
}
