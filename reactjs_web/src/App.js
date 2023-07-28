import {BrowserRouter,Routes,Route} from "react-router-dom"
import "./App.css"
import 'bootstrap/dist/css/bootstrap.min.css';
import HomePage from "./page/home/HomePage";
import AboutPage from "./page/about/AboutPage";
import CustomerPage from "./page/customer/CustomerPage"
import UserPage from "./page/user/UserPage"
import CategoryPage from "./page/category/CategoryPage"
import RouteNotFoundPage from "./page/route-not-found/RouteNotFoundPage"
import ProductPage from "./page/product/PorductPage";
import Layout from "./component/layout/Layout";

import LayoutDashboard from "./component/layout/LayoutDashboard";
import HomePageDash from "./page-dashboard/home/HomePage";
import ProductPageDash from "./page/product/PorductPage";
import CategoryPageDash from "./page-dashboard/category/CategoryPage";
import CartPageDash from "./page-dashboard/cart/CartPage";
import OrderPageDash  from "./page-dashboard/order/OrderPage";


function App() {
  // check is has path "dashboard"
  const is_dashbord = window.location.pathname.includes("dashboard") // true/false
  return (
    <BrowserRouter>
      {/* Route website  & backend*/}
      <Routes>
        {/* website */}
        <Route path="/" element={<Layout />}>
          <Route path="" element={<HomePage />} />
          <Route path="about" element={<AboutPage />} />
          <Route path="customer" element={<CustomerPage />} />
          <Route path="user" element={<UserPage />} />
          <Route path="product" element={<ProductPage />} />
          <Route path="cateory" element={<CategoryPage />} />
        </Route>
        {/* backend */}
        <Route path="/dashboard" element={<LayoutDashboard />}>
            <Route path="" element={<HomePageDash/> } />
            <Route path="category" element={<CategoryPageDash/>} />
        </Route>
      </Routes>
    </BrowserRouter>
    
  );
}

export default App;


/* { !is_dashbord && // config route for website public 
        <div>
          <Layout />
          <Routes>
              <Route path="" element={<HomePage />} />
              <Route path="about" element={<AboutPage />} />
              <Route path="customer" element={<CustomerPage />} />
              <Route path="user" element={<UserPage />} />
              <Route path="product" element={<ProductPage />} />
              <Route path="cateory" element={<CategoryPage />} />
              <Route path="*" element={<RouteNotFoundPage />} />
          </Routes>
        </div> 
      }

      {is_dashbord && // config route for backend (require login)
        <div>
          <LayoutDashboard />
          <Routes>
            <Route path="dashboard">
              <Route path="" element={<HomePageDash/>} />
              <Route path="customer" element={<CustomerPageDash/> } />
              <Route path="cart" element={<CartPageDash/>} />
              <Route path="category" element={<OrderPageDash/>} />
              <Route path="product" element={<ProductPageDash/>} />
            </Route>
          </Routes> 
        </div>
      } */
