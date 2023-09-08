import axios from "axios";
import cookie from "react-cookies";

const SERVER_CONTEXT = "/NhaHang";
const SERVER = "http://localhost:8080";
export const endpoints ={
    "branchs":`${SERVER_CONTEXT}/api/branchs/`,
    "halls":`${SERVER_CONTEXT}/api/halls/`,
    "foods":`${SERVER_CONTEXT}/api/foods/`,
    "services":`${SERVER_CONTEXT}/api/services/`,
    "login":`${SERVER_CONTEXT}/api/login/`,
    "current-user":`${SERVER_CONTEXT}/api/current-user/`,
    "register":`${SERVER_CONTEXT}/api/users/`,
    "hall":`${SERVER_CONTEXT}/api/halls/{id}/`,
    "hallprice":`${SERVER_CONTEXT}/api/hallprices/{id}/`,
    "pay":`${SERVER_CONTEXT}/api/pay/`,
}

export const authApi = () => {
    return axios.create({
        baseURL: SERVER,
        headers: {
            "Authorization": cookie.load("token")
        }
    })
}

export default axios.create({
    baseURL: SERVER
})