module.exports = cds.service.impl(async function () {
    const { EmployeeSet } = this.entities;

    this.before('UPDATE', EmployeeSet, (req, res) => {
        if (parseFloat(req.data.salaryAmount) >= 1000000) {
            req.error('500', 'Salary is more than 1mn');
        }
    })
})