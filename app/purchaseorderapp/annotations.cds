using CatalogService as service from '../../srv/CatalogService';


// First Screen with Search Fields and table columns

annotate service.POs with @(
    UI:{
        SelectionFields  : [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            CURRENCY_CODE
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type: 'UI.DataFieldForAction',
                Label: 'Boost',
                Action: 'CatalogService.boost',
                Inline: true
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
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
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
                Criticality: Criticality,
                CriticalityRepresentation : #WithIcon
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>PurchaseOrder}',
            TypeNamePlural : '{i18n>PurchaseOrders}',
            Title:{
                Label: '{i18n>POID}',
                Value: PO_ID
            },
            Description:{
                Label: '{i18n>DESC}',
                Value: PARTNER_GUID.COMPANY_NAME
            }
        },
    }
);

// annotate service.POs with @(
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : '{i18n>Node_Key}',
//             Value : NODE_KEY,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : '{i18n>Currency}',
//             Value : CURRENCY_CODE,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : '{i18n>Gross_Amount}',
//             Value : GROSS_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : '{i18n>Net_Amount}',
//             Value : NET_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : '{i18n>Tax_Amount}',
//             Value : TAX_AMOUNT,
//         },
//     ]
// );
annotate service.POs with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CURRENCY_CODE',
                Value : CURRENCY_CODE,
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
                Value : NODE_KEY,
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
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'PO Header Details',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },{
            $Type: 'UI.ReferenceFacet',
            Label: 'PO Item Details',
            Target : 'Items/@UI.LineItem'
        }
    ]
);

annotate service.POItems with @(
    UI:{
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
                Label: 'PO Node Key'
            },{
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRODUCT_ID,
                Label: 'Product ID'
            },{
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
                Label: 'Po Item Position'
            },{
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            }
        ],
    }
);

