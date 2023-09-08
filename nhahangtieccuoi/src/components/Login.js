import { useContext, useState } from "react";
import { Button, Form } from "react-bootstrap";
import Apis, { authApi, endpoints } from "../configs/Apis";
import cookie from "react-cookies";
import { MyUserContext } from "../App";
import { Navigate, useSearchParams } from "react-router-dom";

const Login = () => {
    const [user,dispatch] = useContext(MyUserContext);
    const [username, setUsername] = useState();
    const [password, setPassword] = useState();
    const [q] = useSearchParams();

    const login = (evt) => {
        evt.preventDefault();

        const process = async () =>{
            try {
                let res = await Apis.post(endpoints['login'],{
                    "username" : username,
                    "password" : password
                })
                cookie.save("token", res.data);

                let {data} = await authApi().get(endpoints['current-user']);
                cookie.save("user",data);
                dispatch({
                    "type": "login",
                    "payload": data
                })
            } catch (ex) {
                console.error(ex);
            }
        }

        process();
    }
    if(user !== null){
        let next = q.get("next") || "/";

        return <Navigate to={next}/>
    }  
    return <>
        <h1 className="text-center text-info">ĐĂNG NHẬP NGƯỜI DÙNG</h1>
        <Form onSubmit={login}>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                <Form.Label>Tên Đăng Nhập</Form.Label>
                <Form.Control type="text" value={username} onChange={e =>setUsername(e.target.value)} placeholder="Tên đăng nhập" />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput2">
                <Form.Label>Mật Khẩu</Form.Label>
                <Form.Control type="password" value={password} onChange={e =>setPassword(e.target.value)} placeholder="Mật khẩu" />
            </Form.Group>
            <Form.Group className="mb-3" >
                <Button type="submit" variant="danger">Đăng nhập</Button>
            </Form.Group>
        </Form>
    </>
}

export default Login;