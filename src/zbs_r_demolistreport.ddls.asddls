@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZBS_DemoList'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZBS_R_DemoListReport
  as select from zbs_demo_list as ListReport
{
  key key_value             as KeyValue,
      description           as Description,
      doc_type              as DocType,
      doc_description       as DocDescription,
      @Semantics.amount.currencyCode: 'Currency'
      amount                as Amount,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency              as Currency,
      sell_info             as SellInfo,
      persons               as Persons,
      validated             as ValidatedEntry,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
