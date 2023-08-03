import React from 'react'
import "./LoginDashBoard.css"

function LoginDashBoard() {
    const onLogin = () => {
        // check in api : past username,password
        // login success

        // localStorage.setItem("key","value") // create new local variable "" 
        // const data = localStorage.getItem("key") // get value from local variable
        // localStorage.removeItem("key") // remove key
        
        localStorage.setItem("isLogin","1")
        window.location.href="/dashboard"
    }
  return (
    <div>
        <div className='LoginDashBoardContainer'>
            <div>Login</div>
            <input placeholder='Username'/><br/>
            <input placeholder='Passsword'/><br/>
            <div>
                <button onClick={onLogin}>Login</button>
            </div>
        </div>
    </div>
  )
}

export default LoginDashBoard



