
const ct = require("../controller/customer.contoller")
const customer = (app,base_route) => {
    app.get(base_route,ct.getAll)
    app.get(`${base_route}/:id`,ct.getOne) // id params // req.params.id
    app.post(base_route,ct.create)
    app.post(`${base_route}/auth/login`,ct.login)
    app.put(base_route,ct.update)
    app.delete(`${base_route}/:id`,ct.remove)

    app.get(`${base_route}_address`,ct.listAddress) // api/customer/address get
    app.get(`${base_route}_address/:id`,ct.listOneAddress) // api/customer/address/1 get
    app.post(`${base_route}_address`,ct.newAddress) // api/customer/address , post
    app.put(`${base_route}_address`,ct.updateAddress) // api/customer/address , put
    app.delete(`${base_route}_address/:id`,ct.removeAddress) // // api/customer/address/1 , delete
}
module.exports = customer;