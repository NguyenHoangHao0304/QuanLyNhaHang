import { useRef, useState } from "react";
import { Alert, Button, Form } from "react-bootstrap";
import Apis, { endpoints } from "../configs/Apis";
import { useNavigate } from "react-router-dom";
import MySpinner from "../layout/MySpinner";

const Register = () => {
  const [user, setUser] = useState({
    firstName: "",
    lastName: "",
    username: "",
    email: "",
    phone: "",
    password: "",
    confirmPassword: "",
  });

  const [loading, setLoading] = useState(false);
  const avatar = useRef();
  const [errors, setErrors] = useState({
    firstName: false,
    lastName: false,
    username: false,
    confirmPassword: false,
    avatar: false,
  });

  let nav = useNavigate();

  const change = (evt, field) => {
    setUser((current) => {
      return { ...current, [field]: evt.target.value };
    });
    setErrors((current) => {
      return { ...current, [field]: false };
    });
  };

  const validateEmail = (email) => {
    const emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
    return emailRegex.test(email);
  };

  const validatePhone = (phone) => {
    const phoneRegex = /^0\d{9}$/;
    return phoneRegex.test(phone);
  };

  const validatePassword = (password) => {
    const passwordRegex = /^.*[!@#$%^&*].*$/;
    return password.length >= 6 && passwordRegex.test(password);
  };
  const register = (evt) => {
    evt.preventDefault();

    const validationErrors = {};
    for (const field in user) {
      if (!user[field]) {
        validationErrors[field] = true;
      }
    }

    if (!validateEmail(user.email)) {
      validationErrors.email = true;
    }

    if (!validatePhone(user.phone)) {
      validationErrors.phone = true;
    }

    if (!validatePassword(user.password)) {
      validationErrors.password = true;
    }

    if (user.password !== user.confirmPassword) {
      validationErrors.confirmPassword = true;
    }

    if (!avatar.current.files[0]) {
      validationErrors.avatar = true;
    }

    setErrors(validationErrors);

    if (Object.keys(validationErrors).length > 0) {
      return;
    }

    const process = async () => {
      let formData = new FormData();

      for (let field in user)
        if (field !== "confirmPassword") formData.append(field, user[field]);

      formData.append("avatar", avatar.current.files[0]);

      setLoading(true);
      let res = await Apis.post(endpoints[`register`], formData);

      if (res.status === 201) {
        nav("/login");
      }
    };
    process();
  };
  return (
    <>
      <h1 className="text-center text-info">ĐĂNG KÝ NGƯỜI DÙNG</h1>
      <Form onSubmit={register}>
        <Form.Group className="mb-3">
          <Form.Label>Họ</Form.Label>
          <Form.Control
            type="text"
            placeholder="Họ"
            value={user.firstName}
            onChange={(e) => change(e, "firstName")}
            
          />
          {errors.firstName && (
            <Alert variant="danger" className="mt-2">
              Vui lòng điền Họ!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Tên</Form.Label>
          <Form.Control
            type="text"
            placeholder="Tên"
            value={user.lastName}
            onChange={(e) => change(e, "lastName")}
            
          />
          {errors.lastName && (
            <Alert variant="danger" className="mt-2">
              Vui lòng điền Tên!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Tên Đăng Nhập</Form.Label>
          <Form.Control
            type="text"
            value={user.username}
            onChange={(e) => change(e, "username")}
            placeholder="Tên đăng nhập"
            
          />
          {errors.username && (
            <Alert variant="danger" className="mt-2">
              Vui lòng điền username!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Email</Form.Label>
          <Form.Control
            type="email"
            value={user.email}
            onChange={(e) => change(e, "email")}
            placeholder="email"
            
          />
          {errors.email && (
            <Alert variant="danger" className="mt-2">
              Vui lòng điền email theo định dạng ***@***.***.***!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Phone</Form.Label>
          <Form.Control
            type="tel"
            value={user.phone}
            onChange={(e) => change(e, "phone")}
            placeholder="phone"
            
          />
          {errors.phone && (
            <Alert variant="danger" className="mt-2">
              Vui lòng điền phone đúng định dạng 0*********!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Mật Khẩu</Form.Label>
          <Form.Control
            type="password"
            value={user.password}
            onChange={(e) => change(e, "password")}
            placeholder="Mật khẩu"
            
          />
          {errors.password && (
            <Alert variant="danger" className="mt-2">
              Mật khẩu phải có ít nhất 6 ký tự và chứa ít nhất một ký tự đặt
              biệt.
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Xác Nhận Mật Khẩu</Form.Label>
          <Form.Control
            type="password"
            value={user.confirmPassword}
            onChange={(e) => change(e, "confirmPassword")}
            placeholder="Xác Nhận Mật khẩu"
            
          />
          {errors.confirmPassword && (
            <Alert variant="danger" className="mt-2">
              mật khẩu không khớp!!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Label>Ảnh đại diện</Form.Label>
          <Form.Control type="file" ref={avatar}  />
          {errors.avatar && (
            <Alert variant="danger" className="mt-2">
              Vui lòng chọn ảnh đại diện!
            </Alert>
          )}
        </Form.Group>
        <Form.Group className="mb-3">
          {loading === true ? (
            <MySpinner />
          ) : (
            <Button type="submit" variant="danger">
              Đăng Ký
            </Button>
          )}
        </Form.Group>
      </Form>
    </>
  );
};

export default Register;
