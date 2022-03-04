
const cds = require("@sap/cds");
const { employees } = cds.entities("suman.db.master");
const mysrvdemo = function (srv) {
    srv.on("myFunction", (req, res) => {
        return "hello " + req.data.msg;
    });

    srv.on("READ", "ReadEmoloyeeSrv", async (req, res) => {
        var results = [];
        // results.push({
        //     "ID": "02BD2137-0890-1EEA-A6C2-BB55C19787FB",
        //     "nameFirst": "Suman",
        //     "nameLast": "Kumar"
        // });

        // CDS Query Language/ DB agnostic Query will run on any DB in future.(Working)
        // results = await cds.tx(req).run(SELECT.from(employees).limit(5));

        //Select single record(Working)
        // results = await cds.tx(req).run(SELECT.one.from(employees).where({"Currency_code": "USD"}));

        // Using Service APIs plus Fluent APIs(Working)
        // results = cds.read('master.employees').where({ID:"02BD2137-0890-1EEA-A6C2-BB55C19787FB"});

        // CDS Query if user passes key like /Entity/key
        var whereClause = req.data;
        console.log(req);
        console.log(whereClause);
        if (whereClause.hasOwnProperty("ID")) {
            results = await cds.tx(req).run(SELECT.one.from(employees).where(whereClause));
        } else {
            results = await cds.tx(req).run(SELECT.from(employees).limit(1));
        }


        return results;
    });
    srv.on("CREATE", "InsertEmoloyeeSrv", async (req, res) => {
        let returnData = await cds.transaction(req).run([
            INSERT.into(employees).entries([req.data])
        ]).then((resolve, reject) => {
            if (typeof (resolve) !== undefined) {
                return req.data;
            } else {
                req.error(500, "There was an issue in insert");
            }
        }).catch(err => {
            req.error(500, "there was an error " + err.toString());
        });
        return returnData;
    });
    srv.on("UPDATE", "UpdateEmoloyeeSrv", async (req, res) => {
        let returnData = await cds.transaction(req).run([
            UPDATE(employees).set({
                nameFirst: req.data.nameFirst
            }).where({ ID: req.data.ID }),
            UPDATE(employees).set({
                nameLast: req.data.nameLast
            }).where({ ID: req.data.ID })
        ]).then((resolve, reject) => {
            if (typeof (resolve) !== undefined) {
                return req.data;
            } else {
                req.error(500, "There was an issue in update");
            }
        }).catch(err => {
            req.error(500, "there was an error " + err.toString());
        });
        return returnData;
    });

    srv.on("DELETE", "DeleteEmoloyeeSrv", async (req, res) => {
        let returnData = await cds.transaction(req).run([
            DELETE.from(employees).where(req.data)
        ]).then((resolve, reject) => {
            if (typeof (resolve) !== undefined) {
                return req.data;
            } else {
                req.error(500, "There was an issue in update");
            }
        }).catch(err => {
            req.error(500, "there was an error " + err.toString());
        });
        return returnData;
    })
}
module.exports = mysrvdemo;