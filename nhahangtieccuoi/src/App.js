import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./layout/Header";
import Footer from "./layout/Footer";
import Home from "./components/Home";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container } from "react-bootstrap";
import Halls from "./components/Halls";
import Foods from "./components/Foods";
import Login from "./components/Login";
import { createContext, useReducer } from "react";
import MyUserReducer from "./reducers/MyUserReducer";
import cookie from "react-cookies";
import Services from "./components/Services";
import Register from "./components/Register";
import MyCartCounterReducer from "./reducers/MyCartCounterReducer";
import Cart from "./components/Cart";
import HallDetails from "./components/HallDetails";
import BranchDetails from "./components/BranchDetails";
import 'moment/locale/vi';
import UserProfile from "./components/UserProfile";




export const MyUserContext = createContext();
export const MyCartContext = createContext();

const countCart = () => {
  let cart = cookie.load("cart") || null;
  if(cart !== null){
    return Object.values(cart).reduce((init, current) => init + current["quantity"], 0);
  }
  return 0;
}
const App = () => {
  const [user, dispatch] = useReducer(MyUserReducer, cookie.load("user") || null);
  const [cartCounter, cartdispatch] = useReducer(MyCartCounterReducer, countCart());

  return <>
    <MyUserContext.Provider value={[user, dispatch]}>
      <MyCartContext.Provider value={[cartCounter, cartdispatch]}>
        <BrowserRouter >
          <div className="mt-5" style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
            <Header />
            <div className="mt-5" style={{ flex: 1 }}>
              <Container>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/login" element={<Login />} />
                  <Route path="/register" element={<Register />} />
                  <Route path="/halls" element={<Halls />} />
                  <Route path="/foods" element={<Foods />} />
                  <Route path="/services" element={<Services />} />
                  <Route path="/cart" element={<Cart />} />
                  <Route path="/halls/:hallId" element={<HallDetails />} />
                  <Route path="/branchs/:branchId" element={<BranchDetails />} />
                  <Route path="/userProfile" element={<UserProfile />} />
                </Routes>
              </Container>
            </div>
            <Footer />
          </div>
        </BrowserRouter>
      </MyCartContext.Provider>
    </MyUserContext.Provider>
    
    </>
}
export default App;
