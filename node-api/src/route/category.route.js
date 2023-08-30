
const ct = require("../controller/category.controller")
const {userGuard} = require("../controller/auth.controller")
const category = (app,base_route) => {
    app.get(base_route,userGuard(),ct.getAll)
    app.get(`${base_route}/:id`,ct.getOne) // id params // req.params.id
    app.post(base_route,ct.create)
    app.put(base_route,ct.update)
    app.delete(`${base_route}/:id`,ct.remove)
}
module.exports = category;
