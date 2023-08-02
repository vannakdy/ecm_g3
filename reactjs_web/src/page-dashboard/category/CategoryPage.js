
import axios from 'axios'
import {useEffect, useState} from "react"
import {  Table,  Button,  Modal, Form} from "react-bootstrap"
function CategoryPage(){
    const [show,setShow] = useState(false)
    const [showForm,setShowForm] = useState(false)
    const [list,setList] = useState([])
    const [item,setItem] = useState(null)
    const [name,setName] = useState("")
    const [description,setDescription] = useState("")
    const [status,setStatus] = useState("")

    useEffect(()=>{
       getList();
    },[])

    const server = "http://localhost:8081/api/"
    const getList = () =>{ // arrow function
        axios({
            url : server+"category", // url api
            method : "get",
        }).then(res=>{
            var data = res.data
            setList(data.list)
        }).catch(err=>{
            console.log(err)
        })
    }

    const onDelete = () => {
        setShow(false)
        var category_id = item.category_id
        axios({
            url : server+"category/"+category_id, // url api
            method : "delete",
        }).then(res=>{
            var data = res.data
            // (data.message)

            // getList()

            // remove a record in client
            var tmp_data = list.filter((item)=>item.category_id != category_id)
            setList(tmp_data)

        }).catch(err=>{
            console.log(err)
        })
    }

    const onClickBtnDelete = (param) => {
        setItem(param)
        setShow(true)
    }

    const onHideModal = () => {
        setShow(false)
        setItem(null)
    }

    const onHideModalForm = () => {
        setShowForm(false)
        setItem(null)
        clearForm()
    }

    const clearForm = () => {
        setName("")
        setDescription("")
        setStatus("")
    }

    const onSave = () => {
        onHideModalForm()
        var param = {
            "name" : name,
            "description" : description,
            "parent_id" : null,
            "status" : status
        }
        var url = server+"category"
        var method = "post"
        // case update
        if(item != null){
            param.category_id = item.category_id // add new key "category_id" to param
            method = "put"
        }
        axios({
            url:url,
            method:method,
            data:param
        }).then(res=>{
           if(res){
                getList();
                clearForm()
           } 
        })
        
    }

    const onShowModalForm = () => {
        setShowForm(true)
    }

    const onClickEdit = (item) => {
        setItem(item)
        setName(item.name)
        setDescription(item.description)
        setStatus(item.status)
        setShowForm(true)
    }


    return(
        <div style={{padding:10}}>
            <div style={{padding:10,display:"flex",justifyContent:'space-between'}}>
                <div>Category</div>
                <div>
                    <Button variant="primary" onClick={onShowModalForm}>New</Button>
                </div>
            </div>
           <Table striped bordered hover size='sm'>
            <thead>
                <tr>
                    <th>No</th>
                    <th>NAME</th>
                    <th>DESCRIPTION</th>
                    <th>STATUS</th>
                    <th>CREATE</th>
                    <th>ACTION</th>
                </tr>
                
            </thead>
            <tbody>
                {list.map((item,index)=>{
                    return (
                        <tr key={index}>
                            <td>{index+1}</td>
                            <td>{item.name}</td>
                            <td>{item.description}</td>
                            <td>{item.status}</td>
                            <td>{item.create_at}</td>
                            <td>
                                <Button onClick={()=>onClickEdit(item)} variant="primary">Edit</Button>{' '}
                                <Button onClick={()=>onClickBtnDelete(item)} variant="danger">Delete</Button>{' '}
                            </td>
                        </tr>
                    )
                })}
            </tbody>
           </Table >

            <div
                className="modal show"
                style={{ display: 'block', position: 'initial' }}
            >
                <Modal show={show} onHide={onHideModal}>
                    <Modal.Header closeButton>
                        <Modal.Title>Delete</Modal.Title>
                    </Modal.Header>

                    <Modal.Body>
                        <p>Are you sure to remove?</p>
                    </Modal.Body>

                    <Modal.Footer>
                        <Button variant="secondary" onClick={onHideModal}>No</Button>
                        <Button variant="primary" onClick={onDelete}>Yes</Button>
                    </Modal.Footer>
                </Modal>
            </div>

             
            {/* Block modal form insert/update */}
            <div
                className="modal show"
                style={{ display: 'block', position: 'initial' }}
            >
                <Modal show={showForm} onHide={onHideModalForm}>
                    <Modal.Header closeButton>
                        <Modal.Title>{item?.category_id == null ? "Create" : "Update"}</Modal.Title>
                    </Modal.Header>

                    <Modal.Body>
                        <Form>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                <Form.Label>Name</Form.Label>
                                <Form.Control 
                                    value={name} // state name
                                    type="input" 
                                    placeholder="name" 
                                    onChange={(event)=>{
                                        setName(event.target.value) // get value from user onchange => set value to name state
                                    }}
                                />
                            </Form.Group>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                <Form.Label>Description</Form.Label>
                                <Form.Control 
                                    value={description}
                                    as="textarea" 
                                    placeholder='Description'
                                    rows={3}
                                    onChange={(event)=>{
                                        setDescription(event.target.value)
                                    }}
                                />
                            </Form.Group>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                <Form.Label>Status</Form.Label>
                                <Form.Control 
                                    value={status}
                                    type="input" 
                                    placeholder="Status" 
                                    onChange={(event)=>{
                                        setStatus(event.target.value)
                                    }}
                                />
                            </Form.Group>
                        </Form>
                    </Modal.Body>

                    <Modal.Footer>
                        <Button variant="secondary" onClick={onHideModalForm}>Cancel</Button>
                        <Button variant="secondary" onClick={clearForm}>Clear</Button>
                        <Button variant="primary" onClick={onSave}>{(item?.category_id == null) ? "Save" : "Update"}</Button>
                    </Modal.Footer>
                </Modal>
            </div>
        </div>
    )
}

export default CategoryPage;
