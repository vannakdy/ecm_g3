import React from 'react'
import {Outlet} from "react-router-dom"
function LayoutDashboardLogin() {
  return (
    <div>
        <div
            style={{
                padding:20,
                background:"#888"
            }}
        >
            <h1>NIT Cambodia (backend)</h1>

        </div>
        {/* body block*/}
        <div>
            <Outlet />
        </div>
    </div>
  )
}

export default LayoutDashboardLogin
