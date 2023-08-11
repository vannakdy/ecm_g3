const express = require("express") // import 
const app = express() // extend express
const cors = require("cors")
 
// allow origin (npm i cors)
app.use(cors({ //fixed "has been blocked by CORS policy" from client
    origin:"*"
}))

app.use(express.json())
app.get("/",(req,res)=>{ res.send("Hello API")})

const category = require("./src/route/category.route") // import
const product = require("./src/route/product.route")
const employee = require("./src/route/employee.route")
const customer = require("./src/route/customer.route")

category(app,"/api/category")
product(app,"/api/product")
employee(app,"/api/employee")
employee(app,"/api/customer")

app.listen(8081,()=>{
    console.log("http localhost:8081")
})