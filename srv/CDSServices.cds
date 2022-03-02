using {suman.db.CDSViews} from '../db/CDSViews';
using { suman.db.master, suman.db.transaction  } from '../db/datamodel';

service CDSService @(path : '/CDSService') {

    entity POWorkList         as projection on CDSViews.POWorklist;
    entity ProductOrders      as projection on CDSViews.ProductViewSub;
    // entity ProductAggregation as projection on CDSViews.CProductValuesView;

}
