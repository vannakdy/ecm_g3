import { useEffect, useState } from "react";
import UploadAntd from "../component-dash/upload/UploadAntd";
import { request } from '../../share/request'
import MainPageDash from "../component-dash/mainpage/MainPageDash";
import { Button, Col, Form, Input, Modal, Row, Select, Space, Table, message } from "antd";
import { formatDateClient } from "../../share/helper";
function CustomerPageDash() {
    const [loading, setLoading] = useState(false)
    const [list, setList] = useState([])
    const [listProvince,setListProvince] = useState([])
    const [objTotal, setObjTotal] = useState(null)
    const [objFilter, setObjFilter] = useState({})
    const [visible, setVisible] = useState(false)
    const [visibleConfirm,setVisibleConfirm] = useState(false)
    const [customerId,setCustomerId] = useState(null)
    const [form] = Form.useForm();


    const { Option } = Select

    useEffect(() => {
        getList()
    }, [])

    const getList = () => {
        setLoading(true)
        request("customer", "get",).then(res => {
            setLoading(false)
            if (res) {
                setList(res.list)
                setListProvince(res.listProvince)
            }
        })
    }
    const onClickEdit = (row) => {
        form.setFieldsValue(row)
        setVisible(true)
    }
    const onClickDelet = (row) => {
        setCustomerId(row.customer_id)
        setVisibleConfirm(true)
    }

    const removeData = () => {
        setLoading(true)
        setVisibleConfirm(false)
        request("customer/"+customerId,"delete").then(res=>{
            setLoading(false)
            if(res){
                getList()
                Modal.success({
                    content: res.message,
                });
            }else{
                message.error("something wrong!")
            }
        })
    }

    const onClickNew = () => {
        setVisible(true)
    }

    const onCloseModal = () => {
        setVisible(false)
        form.resetFields()
    }

    const onFinish = (item) => {
        setLoading(true)
        request("customer","post",item).then(res=>{
            setLoading(false)
            if(res){
                onCloseModal()
                getList()
            }else{
                message.error("something wrong!")
            }
        })
    }

    return (
        <MainPageDash loading={loading}>
            <div>
                <div>Customer.{list.length}</div>
                <Button onClick={onClickNew} type="primary">New</Button>
            </div>
            <Table
                columns={[
                    {
                        key: "no",
                        title: "No",
                        render: (data, row, index) => index + 1
                    },
                    {
                        key: "firstname",
                        title: "Firstname",
                        dataIndex: "firstname"
                    },
                    {
                        key: "lastname",
                        title: "Lastname",
                        dataIndex: "lastname"
                    },
                    {
                        key: "gender",
                        title: "gender",
                        dataIndex: "gender",
                        render: (item) => item == 1 ? "male" : "female"
                    },
                    {
                        key: "create_at",
                        title: "Create At",
                        dataIndex: "create_at",
                        render: (item) => formatDateClient(item)
                    },
                    {
                        key: "action",
                        title: "Action",
                        render: (item, row) => {
                            return (
                                <Space style={{ textAlign: 'right' }}>
                                    <Button onClick={() => onClickEdit(row)} type="primary">Edit</Button>
                                    <Button onClick={() => onClickDelet(row)} danger>Delete</Button>
                                </Space>
                            )
                        }
                    }
                ]}
                dataSource={list}
            />
            <Modal
                open={visible}
                onCancel={onCloseModal}
                footer={null}
                title={"New Customer"}
            >
                <Form
                    layout="vertical"
                    form={form}
                    onFinish={onFinish}
                >
                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label="Firstname"
                                name={"firstname"}
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please input firstname!',
                                    },
                                ]}
                            >
                                <Input placeholder="fistname" />
                            </Form.Item>

                        </Col>
                        <Col span={12}>
                            <Form.Item
                                label="Lastname"
                                name={"lastname"}
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please input lastname!',
                                    },
                                ]}
                            >
                                <Input placeholder="lastname" />
                            </Form.Item>

                        </Col>
                    </Row>

                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label="Tel"
                                name={"username"}
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please input tel!',
                                    },
                                ]}
                            >
                                <Input placeholder="tel" />
                            </Form.Item>

                        </Col>
                        <Col span={12}>
                            <Form.Item
                                label="Password"
                                name={"password"}
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please input password!',
                                    },
                                ]}
                            >
                                <Input.Password placeholder="password" />
                            </Form.Item>

                        </Col>
                    </Row>



                    <Form.Item
                        label="Gender"
                        name={"gender"}
                        rules={[
                            {
                                required: true,
                                message: 'Please input lastname!',
                            },
                        ]}
                    >
                        <Select defaultValue={"1"}>
                            <Option value={"1"}>Male</Option>
                            <Option value={"0"}>Female</Option>
                        </Select>
                    </Form.Item>

                    <Form.Item
                        label="Province"
                        name={"province_id"}
                        rules={[
                            {
                                required: true,
                                message: 'Please input province!',
                            },
                        ]}
                    >
                        <Select placeholder="Please select province" allowClear>
                            {listProvince?.map((item,index)=>{
                                return (
                                    <Option key={index} value={item.province_id}>{item.name}</Option>
                                )
                            })}
                        </Select>
                    </Form.Item>

                    <Form.Item
                        label="Address Description"
                        name={"address_des"}
                    >
                        <Input.TextArea placeholder="Address description" />
                    </Form.Item>

                    <Form.Item style={{ textAlign: "right" }}>
                        <Space>
                            <Button onClick={onCloseModal} >Cancel</Button>
                            <Button htmlType="submit" type="primary">Save</Button>
                        </Space>
                    </Form.Item>
                </Form>
            </Modal>

             {/* Modal confirm delete  */}
            <Modal
                open={visibleConfirm}
                title="Confirm delete"
                onCancel={()=> setVisibleConfirm(false)}
                onOk={()=>removeData()}

            >
                <p>Are you sure to remove this record!</p>
            </Modal>
        </MainPageDash>
    )
}

export default CustomerPageDash;