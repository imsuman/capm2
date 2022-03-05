using {
    suman.db.master,
    suman.db.transaction
} from '../db/datamodel';

service CatalogService @(path : '/CatalogService') {

    @Capabilities : {
        Insertable,
        Updatable,
        Deletable,
    }
    entity EmployeeSet                         as projection on master.employees;

    entity AddressSet                          as projection on master.address;
    entity ProductSet                          as projection on master.product;
    //  entity ProductTexts as projection on master.prodtext;
    entity BPSet                               as projection on master.businesspartner;

    entity POs @(title : '{i18n>poHeader}')    as projection on transaction.purchaseorder {
        *, case LIFECYCLE_STATUS
               when
                   'N'
               then
                   'New'
               when
                   'D'
               then
                   'Delivered'
               when
                   'B'
               then
                   'Blocked'
           end as LIFECYCLE_STATUS : String(20), 
           case LIFECYCLE_STATUS
                when 'N' then 2
                when 'B' then 1
                when 'D' then 3
                end Criticality:Integer,
           Items : redirected to POItems
    } actions {
        function largestOrder() returns array of POs;
        action boost();
    }

    entity POItems @(title : '{i18n>poItems}') as projection on transaction.poitems {
        *, PARENT_KEY : redirected to POs, PRODUCT_GUID : redirected to ProductSet
    }


}
