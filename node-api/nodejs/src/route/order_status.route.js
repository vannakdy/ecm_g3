

const ct = require("../controller/order_status.controller")
const order_status = (app,base_route) =>{
    app.get(`${base_route}`,ct.getAll)
    app.post(`${base_route}`,ct.create)
    app.delete(`${base_route}`,ct.remove)
}
module.exports = order_status;