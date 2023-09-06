import { useEffect, useState } from "react"
import {request} from "../../share/request"
import {
    Button,
    Space,
    Table, Tag
} from "antd"
import { formatDateClient } from "../../share/helper"
import {
    EditFilled,
    DeleteFilled
} from "@ant-design/icons"


const ProductPageDash = () => {

    const [list,setList] = useState([])

    useEffect(()=>{
        getList()
    },[])

    const getList = () => {

        request("product","get",{}).then(res=>{
            debugger
            if(res){
                setList(res.list)
            }
        })
    }


    // "product_id": 2,
    // "category_id": 1,
    // "barcode": "P002",
    // "name": "Macbook Pro 2014",
    // "quantity": 2,
    // "price": 1700,
    // "image": "",
    // "description": "RAM 8GB, SSD215, 13Inch",
    // "is_active": 1,
    // "create_at": "2023-08-22T14:21:07.000Z",
    // "create_by": null

    return(
        <div>
            <div>Product{list.length}</div>
            <Table 
                pagination={false}
                size="small"
                columns={[
                    {
                        key:"barcode",
                        title:"Barcode",
                        dataIndex:"barcode",
                    },
                    {
                        key:"name",
                        title:"Name",
                        dataIndex:"name",
                    },
                    {
                        key:"quantity",
                        title:"Quantity",
                        dataIndex:"quantity"
                    },
                    {
                        key:"price",
                        title:"Price",
                        dataIndex:"price"
                    },
                    {
                        key:"image",
                        title:"Image",
                        dataIndex:"image"
                    },
                    {
                        key:"description",
                        title:"Description",
                        dataIndex:"description"
                    },
                    {
                        key:"is_active",
                        title:"Active",
                        dataIndex:"is_active",
                        render:(text,record,index)=>{
                            return (
                                <Tag color={text == 1 ? "green" : "pink"} key={"1"}>
                                    {text == 1 ? "Actived" : "Disabled"}
                                </Tag>
                            )
                        }
                    },
                    {
                        key:"create_at",
                        title:"Create",
                        dataIndex:"create_at",
                        render:(text,record,index)=>{
                            return formatDateClient(text)
                        }
                    },
                    {
                        key:"action",
                        title:"Acton",
                        render:(text,record,index)=>{
                            return (
                                <Space key={index}>
                                    <Button type="primary" size="small"><EditFilled/></Button>
                                    <Button danger size="small"><DeleteFilled/></Button>
                                </Space>
                            )
                        }
                    },
                    
                    
                ]}
                dataSource={list}
            />
        </div>
    )
}

export default ProductPageDash;