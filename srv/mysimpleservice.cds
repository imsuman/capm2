
using { suman.db.master, suman.db.transaction } from '../db/datamodel';

service MyServiceDemo {

    function myFunction(msg: String) returns String;

@readonly
entity ReadEmoloyeeSrv as projection on master.employees;
@insertonly
entity InsertEmoloyeeSrv as projection on master.employees;
@updateonly
entity UpdateEmoloyeeSrv as projection on master.employees;
@deleteonly
entity DeleteEmoloyeeSrv as projection on master.employees;

}