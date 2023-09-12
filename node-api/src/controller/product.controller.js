const db = require("../util/db")
const { isEmptyOrNull } = require("../util/service")

const getlist = async (req,res) =>{
    var sql = "SELECT * FROM product ORDER BY product_id DESC"
    var sqlCategory = "SELECT * FROM category"
    // join category pagination search 
    const list = await db.query(sql)
    const category = await db.query(sqlCategory)
    const brand = [
        {
            id : 1,
            name : "Apple"
        },
        {
            id : 2,
            name : "Microsoft"
        },
        {
            id : 3,
            name : "Dell"
        },
    ]
    res.json({
        list :list,
        list_category : category,
        brand : brand,
    })
}

const getone = async (req,res) =>{
    const {id} = req.params;
    var sql = "SELECT * FROM product WHERE product_id = ?"
    const list = await db.query(sql,[id])
    res.json({
        list :list
    })
}

const create = async (req,res) =>{
    var {
        category_id,
        barcode,
        name,
        quantity,
        price,
        image,
        description
    } = req.body;
    var message = {}
    if(isEmptyOrNull(category_id)){ message.category_id = "category_id required!"}
    if(isEmptyOrNull(barcode)){ message.barcode = "barcode required!"}
    if(isEmptyOrNull(name)){ message.name = "name required!"}
    if(isEmptyOrNull(quantity)){ message.quantity = "quantity required!"}
    if(isEmptyOrNull(price)){ message.price = "price required!"}
    if(Object.keys(message).length > 0){
        res.json({
            error:true,
            message:message
        })
        return false;
    }
    var sql = "INSERT INTO product (category_id,barcode,name,quantity,price,image,description) VALUES (?,?,?,?,?,?,?)"
    var param = [category_id,barcode,name,quantity,price,image,description]
    var data = await db.query(sql,param)
    res.json({
        message : "Created product",
        data:data
    })
}

const update = (req,res) =>{
    var {
        product_id,
        category_id,
        barcode,
        name,
        quantity,
        price,
        image,
        description
    } = req.body;
    var message = {}
    if(isEmptyOrNull(product_id)){ message.product_id = "product_id required!"}
    if(isEmptyOrNull(category_id)){ message.category_id = "category_id required!"}
    if(isEmptyOrNull(barcode)){ message.barcode = "barcode required!"}
    if(isEmptyOrNull(name)){ message.name = "name required!"}
    if(isEmptyOrNull(quantity)){ message.quantity = "quantity required!"}
    if(isEmptyOrNull(price)){ message.price = "price required!"}
    if(Object.keys(message).length > 0){
        res.json({
            error:true,
            message:message
        })
        return false;
    }
    var sql = "UPDATE product SET category_id=?, barcode=?, name=?, quantity=?, price=?, image=?, description=? WHERE product_id = ?"
    var param = [category_id,barcode,name,quantity,price,image,description,product_id]
    var data = db.query(sql,param)
    res.json({
        message : "Updated product",
        data:data
    })
}

const remove = async (req,res) =>{
    const {id} = req.body;
    var sql = "DELETE FROM product WHERE product_id = ?"
    const data = await db.query(sql,[id])
    res.json({
        message : "Remove success",
        data : data
    })
}

const changeProductStatus = async (req,res) =>{
    const {is_active} = req.body; // 1 | 0
    var sql = "UPDATE product SET is_active = ? WHERE product_id = ?"
    const data = await db.query(sql,[is_active])
    res.json({
        message : "Update product to "+ (is_active == 0 ? " inactived" : " actived"),
        data : data
    })
}

module.exports = {
    getlist,
    getone,
    create,
    update,
    remove,
    changeProductStatus
}