
const ct = require("../controller/product.controller")
const product = (app) =>{
    app.get("/product",ct.getlist)
    app.get("/product/:id",ct.getone)
    app.post("/product",ct.create)
    app.put("/product",ct.update)
    app.delete("/product",ct.remove)
    app.post("/product_change_status",ct.changeProductStatus)
}
module.exports = product;