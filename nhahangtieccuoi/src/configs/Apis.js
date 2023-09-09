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
    "hall": (hallId) => `${SERVER_CONTEXT}/api/halls/${hallId}/`,
    "hallprice": (hallId) =>`${SERVER_CONTEXT}/api/halls/${hallId}/hallprices/`,
    "pay":`${SERVER_CONTEXT}/api/pay/`,
    "branch": (branchId) => `${SERVER_CONTEXT}/api/branchs/${branchId}/`,
    // "branch":`${SERVER_CONTEXT}/api/branchs/{id}/`,
    "feedbacks":(branchId) => `${SERVER_CONTEXT}/api/branchs/${branchId}/feedbacks/`,
    "add-feedback":`${SERVER_CONTEXT}/api/feedbacks/`,
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