

const getlist = (req,res) =>{
    res.json({
        list : "list all"
    })
}

const getone = (req,res) =>{
    res.json({
        list : "list one"
    })
}

const create = (req,res) =>{
    res.json({
        list : "create product"
    })
}


const update = (req,res) =>{
    res.json({
        list : "update product"
    })
}

const remove = (req,res) =>{
    res.json({
        list : "remove procut"
    })
}

const changeProductStatus = (req,res) =>{
    res.json({
        list : "Chage product status"
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