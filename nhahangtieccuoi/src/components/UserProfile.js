import React, { useState, useEffect } from "react";
import { Alert, Button, Form } from "react-bootstrap";
import { authApi, endpoints } from "../configs/Apis";

const UserProfile = () => {
  const [user, setUser] = useState({});
  const [updatedUser, setUpdatedUser] = useState({});
  const [isEditing, setIsEditing] = useState(false);
  const [error, setError] = useState(null);
  const [validationErrors, setValidationErrors] = useState({});

  useEffect(() => {
    let fetchUserProfile = async () => {
      try {
        let response = await authApi().get(endpoints["current-user"]);
        setUser(response.data);
      } catch (error) {
        console.error("Lỗi khi lấy thông tin tài khoản:", error);
      }
    };
    fetchUserProfile();
  }, []);
  const isNotEmpty = (value) => {
    return value.trim() !== "";
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
    const passwordRegex = /.*[!@#$%^&*].*/;
    return password.length >= 6 && passwordRegex.test(password);
  };

  const validateUserProfile = () => {
    const errors = {};

    if (!isNotEmpty(updatedUser.firstName)) {
      errors.firstName = true;
    }

    if (!isNotEmpty(updatedUser.lastName)) {
      errors.lastName = true;
    }

    if (!validateEmail(updatedUser.email)) {
      errors.email = true;
    }

    if (!validatePhone(updatedUser.phone)) {
      errors.phone = true;
    }

    if (!validatePassword(updatedUser.password)) {
      errors.password = true;
    }

    setValidationErrors(errors);

    return Object.keys(errors).length === 0;
  };

  const handleEditClick = () => {
    setUpdatedUser({ ...user });
    setIsEditing(true);
  };

  const handleCancelClick = () => {
    setIsEditing(false);
    setError(null);
  };

  const handleUpdateClick = async () => {
    if (validateUserProfile()) {
      const process = async () => {
        try {
          const response = await authApi().post(
            endpoints["current-user"],
            updatedUser
          );

          if (response.status === 200) {
            setUser(response.data);
            setIsEditing(false);
            setError(null);
          } else {
            setError("Cập nhật thông tin tài khoản không thành công.");
          }
        } catch (error) {
          console.error("Lỗi khi cập nhật thông tin tài khoản:", error);
          setError("Cập nhật thông tin tài khoản không thành công.");
        }
      };
      process();
    }
  };

  return (
    <div>
      {error && <Alert variant="danger">{error}</Alert>}
      {isEditing ? (
        <div>
          <Form>
            <Form.Group controlId="formFirstName">
              <Form.Label>Họ</Form.Label>
              <Form.Control
                type="text"
                value={updatedUser.firstName}
                onChange={(e) =>
                  setUpdatedUser({ ...updatedUser, firstName: e.target.value })
                }
              />
              {validationErrors.firstName && (
                <Alert variant="danger" className="mt-2">
                  Vui lòng điền Họ!
                </Alert>
              )}
            </Form.Group>
            <Form.Group controlId="formLastName">
              <Form.Label>Tên</Form.Label>
              <Form.Control
                type="text"
                value={updatedUser.lastName}
                onChange={(e) =>
                  setUpdatedUser({ ...updatedUser, lastName: e.target.value })
                }
              />
              {validationErrors.lastName && (
                <Alert variant="danger" className="mt-2">
                  Vui lòng điền Tên!
                </Alert>
              )}
            </Form.Group>
            <Form.Group controlId="formEmail">
              <Form.Label>Email</Form.Label>
              <Form.Control
                type="email"
                value={updatedUser.email}
                onChange={(e) =>
                  setUpdatedUser({ ...updatedUser, email: e.target.value })
                }
              />
              {validationErrors.email && (
                <Alert variant="danger" className="mt-2">
                  Vui lòng điền email theo định dạng ***@***.***.***!
                </Alert>
              )}
            </Form.Group>
            <Form.Group controlId="formPhone">
              <Form.Label>Phone</Form.Label>
              <Form.Control
                type="tel"
                value={updatedUser.phone}
                onChange={(e) =>
                  setUpdatedUser({ ...updatedUser, phone: e.target.value })
                }
              />
              {validationErrors.phone && (
                <Alert variant="danger" className="mt-2">
                  Vui lòng điền phone đúng định dạng 0*********!
                </Alert>
              )}
            </Form.Group>
            <Form.Group controlId="formPassword">
              <Form.Label>Mật Khẩu</Form.Label>
              <Form.Control
                type="password"
                value={updatedUser.password}
                onChange={(e) =>
                  setUpdatedUser({ ...updatedUser, password: e.target.value })
                }
              />
              {validationErrors.password && (
                <Alert variant="danger" className="mt-2">
                  Mật khẩu phải có ít nhất 6 ký tự và chứa ít nhất một ký tự đặt
                  biệt.
                </Alert>
              )}
            </Form.Group>
            <div className="mt-2">
              <Button
                onClick={handleUpdateClick}
                variant="primary"
                className="m-1"
              >
                Lưu
              </Button>
              <Button onClick={handleCancelClick} variant="secondary">
                Hủy
              </Button>
            </div>
          </Form>
        </div>
      ) : (
        <div className="text-center">
          <h2>Thông Tin Tài Khoản</h2>
          <p>
            <strong>Họ:</strong> {user.firstName}
          </p>
          <p>
            <strong>Tên:</strong> {user.lastName}
          </p>
          <p>
            <strong>Tài Khoản:</strong> {user.username}
          </p>
          <p>
            <strong>Email:</strong> {user.email}
          </p>
          <p>
            <strong>Phone:</strong> {user.phone}
          </p>
          <img
            src={user.avatar}
            height={300}
            width={300}
            className="rounded-circle"
          />{" "}
          <br />
          <Button onClick={handleEditClick} variant="warning" className="mt-4">
            Đổi thông tin
          </Button>
        </div>
      )}
    </div>
  );
};

export default UserProfile;
