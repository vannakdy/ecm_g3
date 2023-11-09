import React, { useEffect, useState } from 'react'
import { request } from '../../share/request'
import { Table } from 'antd'
import { formatDateClient } from '../../share/helper'

function EmployeeDash() {
  const [list,setList] = useState([])

  useEffect(()=>{
    getList()
  },[])

  const getList = () => {
    request("employee","get",{}).then(res=>{
      if(res){
        setList(res.list)
      }
    })
  }

  return (
    <div>
      <div>Employee</div>
      <Table 
        columns={[
          {
            title:"No",
            dataIndex:"",
            key:"No",
            render:(item,items,index)=>index + 1
          },
          {
            title:"Firstname",
            dataIndex:"firstname",
            key:"firstname"
          },
          {
            title:"Lastname",
            dataIndex:"lastname",
            key:"lastname"
          },
          {
            title:"Tel",
            dataIndex:"tel",
            key:"tel"
          },
          {
            title:"Email",
            dataIndex:"email",
            key:"email"
          },
          {
            title:"Salary",
            dataIndex:"base_salary",
            key:"base_salary"
          },
          {
            title:"Adress",
            dataIndex:"address",
            key:"address"
          },
          {
            title:"Created",
            dataIndex:"create_at",
            key:"create_at",
            render:(item)=> formatDateClient(item)
          }
        ]}
        dataSource={list}
      />
    </div>
  )
}

export default EmployeeDash
