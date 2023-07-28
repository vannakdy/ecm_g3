
import axios from 'axios'
import {useEffect, useState} from "react"
import {
    Table,
    Button,
    Modal
} from "react-bootstrap"
function CategoryPage(){

    const [x,setX] = useState(0)
    const [y,setY] = useState(0)
    const [show,setShow] = useState(false)
    const [list,setList] = useState([])
    const [item,setItem] = useState({})

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


    return(
        <div style={{padding:20}}>
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
                                <Button variant="primary">Edit</Button>{' '}
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
        </div>
    )
}

export default CategoryPage;
