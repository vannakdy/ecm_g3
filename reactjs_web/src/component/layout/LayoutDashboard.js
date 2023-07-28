
import "./LayoutDashboard.css"
import nit_image from "../../assets/logo/nit.jpeg"
import {useNavigate,Outlet} from "react-router-dom"
function LayoutDashboard(){
    const navigate = useNavigate()
    const onClickMenu = (routeName) => { 
        navigate(routeName)
    }
    return (
        <div>
            <div className="mainHeaderDashboard">
                <div className="brandContain" onClick={()=>onClickMenu("/")}>
                    <img 
                        src={"https://ecm-api.nitcambodia.com/public/nit.jpeg"}
                        style={{width:50,height:50,marginRight:10}}
                    />
                    <div>
                        <div className="txtBrand">NIT Backend</div>
                        <div className="txtSubBrand">NIT Build IT Skill</div>
                        
                    </div>
                </div>
                <div className="menuContain">
                    <ul className="menu">
                        <li onClick={()=>onClickMenu("/dashboard")} className="menuItem">Home</li>
                        <li onClick={()=>onClickMenu("/dashboard/category")} className="menuItem">Category</li>
                        <li onClick={()=>onClickMenu("/dashboard/product")} className="menuItem">Produt</li>
                        <li onClick={()=>onClickMenu("/dashboard/cateogry")} className="menuItem">Cateogry</li>
                        <li onClick={()=>onClickMenu("/dashboard/login")} className="menuItem">Login</li>
                        <li onClick={()=>onClickMenu("/")} className="menuItem">Lo website</li>
                    
                    </ul>
                </div>
            </div>
            <Outlet />
        </div>
    )
}

export default LayoutDashboard;