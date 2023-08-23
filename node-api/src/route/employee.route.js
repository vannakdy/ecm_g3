
const { userGuard } = require("../controller/auth.controller")
const ct = require("../controller/employee.contoller")
const employee = (app,base_route) => {
    app.get(base_route,userGuard,ct.getAll)
    app.get(`${base_route}/:id`,userGuard,ct.getOne) // id params // req.params.id
    app.post(base_route,ct.create)
    app.put(base_route,ct.update)
    app.delete(`${base_route}/:id`,ct.remove)
}
module.exports = employee;