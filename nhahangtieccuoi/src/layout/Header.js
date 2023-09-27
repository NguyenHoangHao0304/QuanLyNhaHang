import { useContext, useEffect, useRef, useState } from "react";
import { Badge, Button, Col, Container, Form, Nav, NavDropdown, Navbar, Row } from "react-bootstrap";
// import Apis, { endpoints } from "../configs/Apis";
// import MySpinner from "./MySpinner";
import { Link, useNavigate } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";
import "./Css.css";


const Header = () => {
    const [user, dispatch] = useContext(MyUserContext);
    const [cartCounter,] = useContext(MyCartContext);
    const [kw, setKw] = useState("");
    const nav = useNavigate();
    const headerRef = useRef(null);

    useEffect(() => {
        const header = headerRef.current;

        if (header) {
            window.addEventListener("scroll", () => {
                if (window.scrollY > 100) {
                    header.classList.add("fixed");
                } else {
                    header.classList.remove("fixed");
                }
            });
        }
    }, []);

    const search = (evt) => {
        const currentPath = window.location.pathname;
        evt.preventDefault();
        if (currentPath === '/foods') {
           nav(`/foods/?kw=${kw}`);
        } else if (currentPath === '/services') {
            nav(`/services/?kw=${kw}`);
        }
        else if (currentPath === '/halls') {
            nav(`/halls/?kw=${kw}`);
        }
    }

    const logout = () => {
        dispatch({
            "type": "logout"
        })
        nav(`/login`)
    }
    return (
        <>
            <div className="fixed-header" ref={headerRef}>
                <Navbar expand="lg" className="bg-body-tertiary ">
                    <Container>
                        <Navbar.Brand href="/"><img src="https://res.cloudinary.com/drqfqkwfo/image/upload/v1691435747/osqbj4rsvciiycykxetv.png" alt="ReactJS" height={70} width={100} /></Navbar.Brand>
                        <Navbar.Toggle aria-controls="basic-navbar-nav" />
                        <Navbar.Collapse id="basic-navbar-nav">
                            <Nav className="me-auto">
                                <Link to="/" className="nav-link">&#128725; Home</Link>
                                <NavDropdown title="Tiệc" id="basic-nav-dropdown">
                                    <Link to="/halls" className="dropdown-item" >Sảnh</Link>
                                    <NavDropdown.Divider />
                                    <Link to="/foods" className="dropdown-item" >Thực Đơn</Link>
                                    <NavDropdown.Divider />
                                    <Link to="/services" className="dropdown-item" >Dịch Vụ</Link>
                                </NavDropdown>
                                {user === null ? <>
                                    <Link className="text-danger nav-link" to="/login">Đăng Nhập</Link>
                                    <Link className="text-danger nav-link" to="/register">Đăng Ký</Link>
                                </> : <>
                                    <Link className="text-danger nav-link" to="/userProfile">Chào, {user.username}</Link>
                                    <Button variant="secondary" onClick={logout}>Đăng Xuất</Button>
                                </>}

                                <Link className="text-danger nav-link" to="/cart">&#128722; <Badge bg="danger">{cartCounter}</Badge></Link>
                            </Nav>
                        </Navbar.Collapse>

                        <Form onSubmit={search} inline>
                            <Row>
                                <Col xs="auto">
                                    <Form.Control
                                        type="text"
                                        value={kw}
                                        onChange={e => setKw(e.target.value)}
                                        placeholder="Nhập từ khóa..."
                                        className=" mr-sm-2"
                                    />
                                </Col>
                                <Col xs="auto">
                                    <Button type="submit">Tìm</Button>
                                </Col>
                            </Row>
                        </Form>
                    </Container>
                </Navbar>
            </div>
        </>
    )
}
export default Header;