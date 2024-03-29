
const db = require("../util/db")
const { isEmptyOrNull, TOKEN_KEY, REFRESH_KEY } = require("../util/service")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")
const { getPermissionUser } = require("./auth.controller")
const getAll = (req,res) => {
    
    
    var sql = "SELECT employee_id,firstname,lastname,tel,email,base_salary,address,province,country,create_at,role_id FROM employee"
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

const login = async (req,res) => {
    var {username,password} = req.body;
    var message = {};
    if(isEmptyOrNull(username)) {message.username = "Please fill in username!"}
    if(isEmptyOrNull(password)) {message.password = "Please fill in password!"}
    if(Object.keys(message).length>0){
        res.json({
            error:true,
            message:message
        })
        return 
    }
    var user = await db.query("SELECT * FROM employee WHERE tel = ?",[username]);
    if(user.length > 0){
        var passDb = user[0].password // get password from DB (#$@*&(FKLSHKLERHIUH@OIUH@#))
        var isCorrrect = bcrypt.compareSync(password,passDb)
        if(isCorrrect){
            var user = user[0]
            delete user.password; // delete colums password from object user'
            var permission = await getPermissionUser(user.employee_id)
            var obj = {
                user:user,
                permission:permission,
            }
            var access_token = jwt.sign({data:{...obj}},TOKEN_KEY,{expiresIn:"2h"})
            var refresh_token = jwt.sign({data:{...obj}},REFRESH_KEY)
            res.json({
                ...obj,
                access_token:access_token,
                refresh_token:refresh_token,
            }) 
        }else{
            res.json({
                message:"Password incorrect!",
                error:true
            }) 
        }
    }else{
        res.json({
            message:"Account does't exist!. Please goto register!",
            error:true
        })
    }
}

const refreshToken = async (req,res)=>{
    // check and verify refresh_token from client 
    var {refresh_key} = req.body;
    if(isEmptyOrNull(refresh_key)){
        res.status(401).send({
            message: 'Unauthorized',
        });
    }else{
        jwt.verify(refresh_key,REFRESH_KEY, async (error,result)=>{
            if(error){
                res.status(401).send({
                    message: 'Unauthorized',
                    error: error
                });
            }else{
                // សុំសិទ្ធទាញុយក acccess token ថ្មី
                var username = result.data.user.tel;
                var user = await db.query("SELECT * FROM employee WHERE tel = ?",[username]);
                var user = user[0]
                delete user.password; // delete colums password from object user'
                var permission = await getPermissionUser(user.employee_id)
                var obj = {
                    user:user,
                    permission:permission,
                }
                var access_token = jwt.sign({data:{...obj}},TOKEN_KEY,{expiresIn:"30s"})
                var refresh_token = jwt.sign({data:{...obj}},REFRESH_KEY)
                res.json({
                    ...obj,
                    access_token:access_token,
                    refresh_token:refresh_token,
                })
            }
        })
    }
}


const setPassword = async (req,res) => {
    const {
        username,
        password
    } = req.body;
    var message = {};
    if(isEmptyOrNull(username)) {message.username = "Please fill in username!"}
    if(isEmptyOrNull(password)) {message.password = "Please fill in password!"}
    if(Object.keys(message).length>0){
        res.json({
            error:true,
            message:message
        })
        return 
    }
    var employee = await db.query("SELECT * FROM employee WHERE tel = ?",[username]);
    if(employee.length > 0){
        var passwordGenerate =  bcrypt.hashSync(password,10) //  12344 => "jsERWERQ@#RSDFA#%$%#$%#@$%#$%SDFA#$#"
        console.log(passwordGenerate)
        var update = await db.query("UPDATE employee SET password = ? WHERE tel=? ",[passwordGenerate,username])
        res.json({
            message:"Passwrod update",
            data:update
        })
    }else{
        res.json({
            message:"Account does't exist!. Please goto register!",
            error:true
        })
    }
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
    remove,
    login,
    setPassword,
    refreshToken
}