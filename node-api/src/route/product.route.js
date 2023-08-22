
const ct = require("../controller/product.controller")
const product = (app,route_name) =>{
    app.get(`${route_name}`,ct.getlist)
    app.get(`${route_name}/:id`,ct.getone)
    app.post(`${route_name}`,ct.create)
    app.put(`${route_name}`,ct.update)
    app.delete(`${route_name}`,ct.remove)
    app.post(`${route_name}/change_status`,ct.changeProductStatus)
}
module.exports = product;