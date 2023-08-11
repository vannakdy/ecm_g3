
// const {db} = require("../util/db")
const db = require("../util/db")
const { isEmptyOrNull } = require("../util/service")
const bcrypt = require("bcrypt")

const getAll =  (req,res) => {
    var sql = "SELECT * FROM customer"
    db.query(sql,(error,row)=>{
        if(error){
            res.json({
                message:error,
                error:true
            })
        }else{
            res.json({
                list:row
            })
        }
    })
}

const getOne = (req,res) =>{
    var id = req.params.id // params from client 
    var sql = "SELECT * FROM customer WHERE customer_id = ?"
    db.query(sql,[id],(error,row)=>{
        if(error){
            res.json({
                message:error,
                error:true
            })
        }else{
            res.json({
                list:row
            })
        }
    })  
}

const create = (req,res) => {
    // check is exist
    // parameter required
    // password bcrypt
    // inert two tables customer/customer_address 
    
    var {
        username, // store telephone
        password,
        firstname,
        lastname,
        gender,
        province_id,
        address_des
    } = req.body;
    // validate parameters
    var message  = {}
    if(isEmptyOrNull(username)){message.username="username required!"}
    if(isEmptyOrNull(password)){message.password="password required!"}
    if(isEmptyOrNull(firstname)){message.firstname="firstname required!"}
    if(isEmptyOrNull(lastname)){message.lastname="lastname required!"}
    if(isEmptyOrNull(gender)){message.gender="gender required!"}
    if(isEmptyOrNull(province_id)){message.province_id="province_id required!"}
    if(Object.keys(message).length > 0){
        res.json({
            error:true,
            message:message
        })
        return false
    }
    // end validate parameters

    // check is existing customer by tel=username
    var sqlFind = "SELECT customer_id FROM customer WHERE username = ? " // sql check customer by username
    db.query(sqlFind,[username],(error1,result1)=>{
        if(result1.length > 0){ // have record => exist cusomter 
            res.json({
                error:true,
                message:"Account already exist!"
            })
            return false;
        }else{
            // bycript passwrod from client
            // password = 121234f => "jsERWERQ@#RSDFA#%$%#$%#@$%#$%SDFA#$#"
            password = bcrypt.hashSync(password,10) //  12344 => "jsERWERQ@#RSDFA#%$%#$%#@$%#$%SDFA#$#"

            var sqlCustomer = "INSERT INTO customer (firstname, lastname, gender, username, password) VALUES (?, ?, ?, ?, ?) "
            var paramCustomer = [firstname, lastname, gender, username, password]
            db.query(sqlCustomer,paramCustomer,(error2,result2)=>{ // insert to customer
                if(!error2){
                    // insert customer_address
                    var sqlCustomerAdd = "INSERT INTO customer_address (customer_id, province_id, firstname, lastname, tel, address_des) VALUES (?,?,?,?,?,?) "
                    var paramCustomerAdd = [result2.insertId, province_id, firstname, lastname, username, address_des]
                    db.query(sqlCustomerAdd,paramCustomerAdd,(error3,result3)=>{
                        if(!error3){
                            res.json({
                                message:"Account created!",
                                data:result3
                            })
                        }else{
                            res.json({
                                error:true,
                                message:error3
                            })
                        }
                    })
                }
            })
        }
    })
}

const update = (req,res) => { // update profile
    const {
        customer_id,
        firstname,
        lastname,
        gender,
    } = req.body

    // check which field required
    var message = {}
    if(isEmptyOrNull(name)){
        message.name = "category name required!";
        res.json({
            error : true,
            message : message
        })
        return 
    }else if(isEmptyOrNull(category_id)){
        message.name = "category_id required!";
        res.json({
            error : true,
            message : message
        })
        return 
    }

    var sql = "UPDATE category SET name=?, description=?, parent_id=?, status=? WHERE category_id = ?";
    var param_sql = [name,description,parent_id,status,category_id]
    db.query(sql,param_sql,(error,row)=>{
        if(error){
            res.json({
                error:true,
                message:error
            })
        }else{
            res.json({
                message : row.affectedRows ? "Update successfully!" : "Data not in system!",
                data : row
            })
        }
    })

}

const remove = (req,res) => {
    var sql = "DELETE FROM customer WHERE customer_id = ?"
    db.query(sql,[req.params.id],(error,row)=>{
        if(!error){
            res.json({
                message: (row.affectedRows) ? "Delete successfully!" : "Data not in system",
                data:row
            })
        }else{
            res.json({
                error:true,
                message:error
            })
        }
    })
}

const listAddress = (req,res) => {}
const listOneAddress = (req,res) => {}
const newAddress = (req,res) => {}
const updateAddress = (req,res) => {}
const removeAddress = (req,res) => {}

module.exports = {
    getAll,
    getOne,
    create,
    update,
    remove,
    listAddress,
    listOneAddress,
    newAddress,
    updateAddress,
    removeAddress
}