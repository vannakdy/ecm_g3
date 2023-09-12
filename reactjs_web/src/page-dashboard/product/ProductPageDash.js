import { useEffect, useState } from "react"
import {request} from "../../share/request"
import {
    Button,
    Col,
    Form,
    Input,
    Modal,
    Row,
    Select,
    Space,
    Table, Tag, message,
} from "antd"
import { formatDateClient } from "../../share/helper"
import {
    EditFilled,
    DeleteFilled
} from "@ant-design/icons"
const {Option} = Select


const ProductPageDash = () => {

    const [list,setList] = useState([])
    const [categoryList,setCategoryList] = useState([])
    const [brand,setBrand] = useState([])
    const [visible,setVisible] = useState(false)
    const [productIdEdit,setProductIdEdit] = useState(null)
    const [form] = Form.useForm();

    useEffect(()=>{
        getList()
    },[])

    const getList = () => {
        request("product","get",{}).then(res=>{
            if(res){
                setList(res.list)
                setCategoryList(res.list_category)
                setBrand(res.brand)
            }
        })
    }

    const onCancelModal = () => {
        setVisible(false)
        setProductIdEdit(null)
        form.resetFields()
    }

    const onFinish = (item) => {
        if(productIdEdit == null){
            var param = {
                "category_id" : item.category,
                "barcode" :  item.barcode,
                "name" :  item.product_name,
                "quantity" :  item.qauntity,
                "price" :  item.price,
                "image" :  item.image,
                "description" :  item.description,
            }
            request("product","post",param).then(res=>{
                if(res){
                    message.success(res.message)
                    form.resetFields();
                    setVisible(false);
                    getList()
                }
            })
        }else{
            var param = {
                "product_id" : productIdEdit,
                "category_id" : item.category,
                "barcode" :  item.barcode,
                "name" :  item.product_name,
                "quantity" :  item.qauntity,
                "price" :  item.price,
                "image" :  item.image,
                "description" :  item.description,
            }
            request("product","put",param).then(res=>{
                if(res){
                    message.success(res.message)
                    form.resetFields();
                    setVisible(false);
                    getList()
                }
            })
        }
        
    }

    const onEditClick = (item) => {
        setVisible(true)
        setProductIdEdit(item.product_id)
        form.setFieldsValue({
            category : item.category_id,
            barcode : item.barcode,
            product_name : item.name,
            qauntity :item.quantity,
            price : item.price,
            image : item.image,
            description : item.description
        })
    }

    const onEditRemove = (item) => {
        var param = {
            id:item.product_id
        }
        request("product","delete",param).then(res=>{
            if(res){
                message.success(res.message)
                getList()
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
            <div style={{display:"flex",justifyContent:'space-between',padding:10}}>
                <div>Product{list.length}</div>
                <Button onClick={()=>setVisible(true)} size="small" type="primary">New</Button>
            </div>
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
                                    <Button onClick={()=>onEditClick(record)} type="primary" size="small"><EditFilled/></Button>
                                    <Button onClick={()=>onEditRemove(record)} danger size="small"><DeleteFilled/></Button>
                                </Space>
                            )
                        }
                    },
                    
                    
                ]}
                dataSource={list}
            />
            {/* Modal */}
            <Modal
                open={visible}
                title={productIdEdit == null  ? "Create" : "Edit"}
                onCancel={onCancelModal}
                footer={null}
                maskClosable={false}
                width={600}
            >
                <Form
                    layout="vertical"
                    form={form}
                    onFinish={onFinish}
                >
                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label={"Barcode"}
                                name={"barcode"}
                                rules={[
                                    {
                                      required: true,
                                      message: 'Please input barcode!',
                                    },
                                ]}
                            >
                                <Input placeholder="Barcode" />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                label={"Product Name"}
                                name={"product_name"}
                                rules={[
                                    {
                                      required: true,
                                      message: 'Please input product name!',
                                    },
                                ]}
                            >
                                <Input placeholder="Product name" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label={"Qauntity"}
                                name={"qauntity"}
                                rules={[
                                    {
                                      required: true,
                                      message: 'Please input qauntity!',
                                    },
                                ]}
                            >
                                <Input placeholder="qauntity" />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item

                                label={"Price"}
                                name={"price"}
                                rules={[
                                    {
                                      required: true,
                                      message: 'Please input product price!',
                                    },
                                ]}
                            >
                                <Input allowClear={true} placeholder="Product name" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item
                        label={"Category"}
                        name={"category"}
                    >
                       <Select
                            placeholder="Select a category"
                            allowClear={true}
                       >
                            {categoryList?.map((item,index)=>{
                                return (
                                    <Option key={index} value={item.category_id}>{item.name}</Option>
                                )
                            })}
                       </Select>
                    </Form.Item>

                    <Form.Item
                        label={"Brand"}
                        name={"brand"}
                    >
                       <Select
                            placeholder="Select a brand (optional)"
                            allowClear={true}
                       >
                            {brand?.map((item,index)=>{
                                return (
                                    <Option key={index} value={item.id}>{item.name}</Option>
                                )
                            })}
                       </Select>
                    </Form.Item>

                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label={"Image"}
                                name={"image"}
                            >
                                <Input placeholder="image" />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                label={"Description"}
                                name={"description"}
                            >
                                <Input placeholder="Product name" />
                            </Form.Item>
                        </Col>
                    </Row>
                    
                    <Form.Item style={{textAlign:'right'}}>
                        <Space align="end">
                            <Button  type="default">Cancel</Button>
                            <Button onClick={()=>form.resetFields()} type="default">Clear</Button>
                            <Button htmlType="submit"  style={{backgroundColor:"green"}}>{productIdEdit == null ? "Save" : "Update"}</Button>
                        </Space>
                    </Form.Item>

               </Form>
            </Modal>
            {/* End Modal */}
        </div>
    )
}

export default ProductPageDash;