

import axios from "axios";
import { getAccessToken } from "./helper";
import { message } from "antd";

export const config = {
    base_server : "http://localhost:8081/api/",
    image_path:"",
    version:1
}
export const request = (url,method,param) => {
    const access_token = getAccessToken();
    return axios({
        url:config.base_server + url,
        method:method,
        data:param,
        headers : {
            Authorization  : "Bearer "+access_token
        }
    }).then(res=>{
        return res.data;
    }).catch(err=>{
        var status = err.response?.status
        if(status == 404){
            message.error("Route Not Found!")
        }else if (status == 401){
            message.error("You don't has permission access this method!")
        }else if (status == 500){
            message.error("Internal error server!")
        }else{
            message.error(err.message)
        }
        return false
    }).finally(final=>{
        console.log("final",final)
    })
}
