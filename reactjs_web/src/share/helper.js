
export const isEmptyOrNull = (value) => {
    return (value == "" || value == null || value == undefined) ? true : false
}

export const getUser = () => {
    var user = localStorage.getItem("user")
    if(!isEmptyOrNull(user)){
        user = JSON.parse(user)
        return user
    }else{
        return null
    }
}

export const getPermission = () => {
    var permission = localStorage.getItem("permission")
    if(!isEmptyOrNull(permission)){
        permission = JSON.parse(permission)
        return permission
    }else{
        return null
    }
}

export const getAccessToken = () => {
    var access_token = localStorage.getItem("access_token")
    if(!isEmptyOrNull(access_token)){
        return access_token;
    }else{
        return null
    }
}

export const getRefreshToken = () => {
    var refresh_token = localStorage.getItem("refresh_token")
    if(!isEmptyOrNull(refresh_token)){
        refresh_token = JSON.parse(refresh_token)
        return refresh_token
    }else{
        return null
    }
}