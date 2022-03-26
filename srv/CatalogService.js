module.exports = cds.service.impl(async function () {
    const { EmployeeSet, POs } = this.entities;

    this.before('UPDATE', EmployeeSet, (req, res) => {
        if (parseFloat(req.data.salaryAmount) >= 1000000) {
            req.error('500', 'Salary is more than 1mn');
        }
    });
    this.on('boost', async req => {
        try {
            const NODE_KEY = req.params[0];
            const tx = cds.tx(req);
            console.log("--------------Hey Suman Begin----------------");
            console.log(req.params);
            console.log(NODE_KEY);
            console.log("--------------Hey Suman End----------------");
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=': 20000 }, 
                NOTE: "Suman Boosted!!"
            }).where(NODE_KEY);
            return "Boost was successful";
        } catch (error) {
            return "Error " + error.toString();
        }
    });

    this.on('largestOrder', async req => {
        try {
            const ID = req.params[0];
            const tx = cds.tx(req);
            const reply = await tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
            return reply;
        } catch (error) {
            return "Error " + error.toString();
        }
    })
})