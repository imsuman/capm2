using CatalogService as service from '../../srv/CatalogService';


// First Screen with Search Fields and table columns

annotate service.POs with {
    PARTNER_GUID @(
        common           : {Text : PARTNER_GUID.COMPANY_NAME},
        valueList.entity : service.BPSet
    )
};

@cds.odata.valuelist
annotate service.BPSet with @(UI.Identification : [{
    $Type : 'UI.DataField',
    Value : COMPANY_NAME,
}]);

annotate service.POItems with {
    PRODUCT_GUID @(
        common           : {Text : PRODUCT_GUID.DESCRIPTION},
        valueList.entity : service.ProductSet
    )
};

@cds.odata.valuelist
annotate service.ProductSet with @(UI.Identification : [{
    $Type : 'UI.DataField',
    Value : DESCRIPTION,
}]);


annotate service.POs with @(UI : {
    SelectionFields : [
        PO_ID,
        GROSS_AMOUNT,
        LIFECYCLE_STATUS,
        Currency.code
    ],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Label  : 'Boost',
            Action : 'CatalogService.boost',
            Inline : true
        },
        {
            $Type : 'UI.DataField',
            Value : Currency.code,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type                     : 'UI.DataField',
            Value                     : LIFECYCLE_STATUS,
            Criticality               : Criticality,
            CriticalityRepresentation : #WithIcon
        },
    ],
    HeaderInfo      : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>PurchaseOrder}',
        TypeNamePlural : '{i18n>PurchaseOrders}',
        Title          : {
            Label : '{i18n>POID}',
            Value : PO_ID
        },
        Description    : {
            Label : '{i18n>DESC}',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl       : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQplQ5pEpKcGSHozKhJhlLIFfl_jS4SVLChcQ&usqp=CAU',
    },
});


annotate service.POs with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'CURRENCY_CODE',
                Value : Currency.code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'GROSS_AMOUNT',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NET_AMOUNT',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TAX_AMOUNT',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NODE_KEY',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PO_ID',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PARTNER_GUID_NODE_KEY',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LIFECYCLE_STATUS',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OVERALL_STATUS',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NOTE',
                Value : NOTE,
            },
        ],
    },
    UI.Facets                      : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneratedFacet1',
            Label  : 'PO Header Details',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'PO Item Details',
            Target : 'Items/@UI.LineItem'
        }
    ]
);

annotate service.POItems with @(UI : {
    LineItem                   : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
            Label : 'PO Node Key'
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRODUCT_ID,
            Label : 'Product ID'
        },
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            Label : 'Po Item Position'
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : Currency.code,
        }
    ],
    HeaderInfo                 : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'PO Item',
        TypeNamePlural : 'PO Items',
        Title          : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        }
    },
    Facets                     : [
        {
            Label  : 'Line Item Header',
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#LineItemHeader',
        },
        {
            Label  : 'Product Details',
            $Type  : 'UI.ReferenceFacet',
            Target : 'PRODUCT_GUID/@UI.FieldGroup#ProductDetails'
        }
    ],
    FieldGroup #LineItemHeader : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : Currency.code,
            },
        ]
    }
});

annotate service.ProductSet with @(UI : {FieldGroup #ProductDetails : {
    $Type : 'UI.FieldGroupType',
    Data  : [
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : DESCRIPTION,
        },
        {
            $Type : 'UI.DataField',
            Value : TYPE_CODE,
        },
        {
            $Type : 'UI.DataField',
            Value : CATEGORY,
        },
        {
            $Type : 'UI.DataField',
            Value : SUPPLIER_GUID.COMPANY_NAME,
        },
    ]
}, });
