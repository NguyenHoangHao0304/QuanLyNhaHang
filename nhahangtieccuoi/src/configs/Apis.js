import axios from "axios";

const SERVER_CONTEXT = "/NhaHang";
export const endpoints ={
    "branchs":`${SERVER_CONTEXT}/api/branchs`,
    "foods":`${SERVER_CONTEXT}/api/foods`
}
export default axios.create({
    baseURL: "http://localhost:8080"
})