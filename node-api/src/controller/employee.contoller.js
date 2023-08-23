
const db = require("../util/db")
const { isEmptyOrNull } = require("../util/service")

const getAll = (req,res) => {
    
    var sql = "SELECT firstname AS FirstName, lastname AS LastName FROM employee"
    db.query(sql,(error,row)=>{
        if(error){
            res.json({
                message:error,
                error:true
            })
        }else{
            res.json({
                user : req.user,
                user_id : req.user_id,
                list:row
            })
        }
    })
}

const getOne = (req,res) =>{
    var id = req.params.id // params from client 
    var sql = "SELECT * FROM employee WHERE employee_id = ?"
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
    const {
        firstname,
        lastname,
        tel,
        email,
        base_salary,
        address,
        province,
        country
    } = req.body

    // check which field required
    var message = {}
    if(isEmptyOrNull(firstname)){
        message.firstname = "firstname required!"
    }
    if(isEmptyOrNull(lastname)){
        message.lastname = "lastname required!"
    }
    if(isEmptyOrNull(tel)){
        message.tel = "tel required!"
    }
    // Object.keys(message).length // return length of object message
    if(Object.keys(message).length > 0 ){
        res.json({
            error : true,
            message : message
        })
        return 
    }
    // end check which field required

    var sql = "INSERT INTO employee (`firstname`, `lastname`, `tel`, `email`, `base_salary`, `address`, `province`, `country`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    var param_data = [firstname,lastname,tel,email,base_salary,address,province,country]
    db.query(sql,param_data,(error,row)=>{
        if(error){
            res.json({
                error:true,
                message : error
            })
        }else{
            res.json({
                message:"Employee create successfully!",
                data : row
            })
        }
    })
}

const update = (req,res) => {
    const {
        employee_id,
        firstname,
        lastname,
        tel,
        email,
        base_salary,
        address,
        province,
        country
    } = req.body

    // check which field required
    var message = {}
    if(isEmptyOrNull(employee_id)){
        message.employee_id = "employee_id required!"
    }
    if(isEmptyOrNull(firstname)){
        message.firstname = "firstname required!"
    }
    if(isEmptyOrNull(lastname)){
        message.lastname = "lastname required!"
    }
    if(isEmptyOrNull(tel)){
        message.tel = "tel required!"
    }
    // Object.keys(message).length // return length of object message
    if(Object.keys(message).length > 0 ){
        res.json({
            error : true,
            message : message
        })
        return 
    }
    // end check which field required

    var sql = "UPDATE employee SET firstname=?, lastname=?, tel=?, email=?, base_salary=?, address=?, province=?, country=? WHERE employee_id = ?";
    var param_sql = [firstname,lastname,tel,email,base_salary,address,province,country,employee_id]
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
    var {id} = req.params
    var sql = "DELETE FROM employee WHERE employee_id = ?"
    db.query(sql,[id],(error,row)=>{
        if(!error){
            res.json({
                // message: (row.affectedRows != 0) ? "Delete successfully!" : "Data not in system",
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

module.exports = {
    getAll,
    getOne,
    create,
    update,
    remove
}