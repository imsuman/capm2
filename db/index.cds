using {
    suman.db.master,
    suman.db.transaction
} from './datamodel';

annotate master.businesspartner with {
    NODE_KEY      @title : '{i18n>bp_key}';
    BP_ROLE       @title : '{i18n>bp_role}';
    EMAIL_ADDRESS @title : '{i18n>email_addr}';
    PHONE_NUMBER  @title : '{i18n>Phone_Number}';
    FAX_NUMBER    @title : '{i18n>Fax_Number}';
    WEB_ADDRESS   @title : '{i18n>WEB_ADDRESS}';
    ADDRESS_GUID  @title : '{i18n>Address_Guid}';
    COMPANY_NAME  @title : '{i18n>company_name}';
};

annotate master.address with {
    NODE_KEY        @title : '{i18n>ap_key1}';
    CITY            @title : '{i18n>City}';
    POSTAL_CODE     @title : '{i18n>Postal_Code}';
    STREET          @title : '{i18n>Street}';
    BUILDING        @title : '{i18n>Building}';
    COUNTRY         @title : '{i18n>Country}';
    ADDRESS_TYPE    @title : '{i18n>Addr_Type}';
    VAL_START_DATE  @title : '{i18n>VAL_START_DATE}';
    VAL_END_DATE    @title : '{i18n>VAL_END_DATE}';
    LATITUDE        @title : '{i18n>LATITUDE}';
    LONGITUDE       @title : '{i18n>LONGITUDE}';
    businesspartner @title : '{i18n>businesspartner}';
};

annotate transaction.purchaseorder with {
    NODE_KEY         @title : '{i18n>ap_key2}';
    PO_ID            @title : '{i18n>po_id}';
    PARTNER_GUID     @title : '{i18n>partner_guid}';
    LIFECYCLE_STATUS @title : '{i18n>lifecycle_status}';
    OVERALL_STATUS   @title : '{i18n>overall_status}';
    Items            @title : '{i18n>items}';
    NOTE             @title : '{i18n>note}';
    GROSS_AMOUNT     @title : '{i18n>gross_amount}';
    NET_AMOUNT       @title : '{i18n>net_amount}';
    CURRENCY_CODE    @title : '{i18n>currency_code}';
    TAX_AMOUNT       @title : '{i18n>tax_amount}';

}
