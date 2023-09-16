import { useRef, useState } from "react";
import { Button, Form } from "react-bootstrap";
import Apis, { endpoints } from "../configs/Apis";
import { useNavigate } from "react-router-dom";
import MySpinner from "../layout/MySpinner";


const Register = () => {
    const [user, setUser] = useState({
        "firstName": "",
        "lastName": "",
        "username": "",
        "password": "",
        "confirmPassword": "",
    });

    const[loading, setLoading] = useState(false);
    const avatar = useRef();
    let nav = useNavigate();

    const change = (evt, field) => {
        setUser(current => {
            return { ...current, [field]: evt.target.value }
        })
    }

    const register = (evt) => {
        evt.preventDefault();

        const process = async () => {
            let formData = new FormData();

            for (let field in user)
                if (field !== "confirmPassword") 
                    formData.append(field, user[field]);

            formData.append("avatar", avatar.current.files[0]);

            setLoading(true);
            let res = await Apis.post(endpoints[`register`], formData);

            if (res.status === 201) {
                nav("/login");
            }
        }

        if (user.password !== user.confirmPassword) {
            //....
        } else {
            process();
        }
    }
    return <>
        <h1 className="text-center text-info">ĐĂNG KÝ NGƯỜI DÙNG</h1>
        <Form onSubmit={register}>
            <Form.Group className="mb-3" >
                <Form.Label>Họ</Form.Label>
                <Form.Control type="text" placeholder="Họ" value={user.firstName} onChange={e => change(e, "firstName")} required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Tên</Form.Label>
                <Form.Control type="text" placeholder="Tên" value={user.lastName} onChange={e => change(e, "lastName")} required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Tên Đăng Nhập</Form.Label>
                <Form.Control type="text" value={user.username} onChange={e => change(e, "username")} placeholder="Tên đăng nhập" required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Mật Khẩu</Form.Label>
                <Form.Control type="password" value={user.password} onChange={e => change(e, "password")} placeholder="Mật khẩu" required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Xác Nhận Mật Khẩu</Form.Label>
                <Form.Control type="password" value={user.confirmPassword} onChange={e => change(e, "confirmPassword")} placeholder="Xác Nhận Mật khẩu" required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Ảnh đại diện</Form.Label>
                <Form.Control type="file" ref={avatar} required/>
            </Form.Group>
            <Form.Group className="mb-3" >
                {loading === true?<MySpinner />:<Button type="submit" variant="danger">Đăng Ký</Button>}
                
            </Form.Group>
        </Form>
    </>
}

export default Register;