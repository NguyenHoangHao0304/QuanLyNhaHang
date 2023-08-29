import { useEffect, useState } from "react";
import { Button, Col, Container, Form, Nav, NavDropdown, Navbar, Row } from "react-bootstrap";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "./MySpinner";
import { useNavigate } from "react-router-dom";


const Header = () => {
    const [branchs, setBranchs] = useState(null);
    const [kw,setKw] = useState("");
    const nav = useNavigate();
    useEffect(() => {
        const loadBranchs = async () => {
            // let res = await fetch("http://localhost:8080/NhaHang/api/branchs");
            // let data = await res.json();
            let res = await Apis.get(endpoints['branchs']);
            setBranchs(res.data);
        }
        loadBranchs();
    }, [])

    const search = (evt) =>{
        evt.preventDefault();
        nav(`/foods/?kw=${kw}`);
    }

    if (branchs === null) {
        return <MySpinner />
    }
    return (
        <>
            <Navbar expand="lg" className="bg-body-tertiary">
                <Container>
                    <Navbar.Brand href="/"><img src="https://res.cloudinary.com/drqfqkwfo/image/upload/v1691435747/osqbj4rsvciiycykxetv.png" alt="ReactJS" height={70} width={100} /></Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Nav.Link href="/">Trang chủ</Nav.Link>
                            <NavDropdown title="Chi Nhánh" id="basic-nav-dropdown">
                                {branchs.map(b => <NavDropdown.Item href="#action3" key={b.id}>{b.branchName}</NavDropdown.Item>)}
                            </NavDropdown>
                            <NavDropdown title="Tiệc Cưới" id="basic-nav-dropdown">
                                <NavDropdown.Item href="/halls" >Sảnh Tiệc</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="/foods" >Thực Đơn</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action3" >Dịch Vụ</NavDropdown.Item>
                            </NavDropdown>
                            <NavDropdown title="Hội Nghị" id="basic-nav-dropdown">
                                <NavDropdown.Item href="#action3" >Sảnh Tiệc</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action3" >Thực Đơn</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action3" >Dịch Vụ</NavDropdown.Item>
                            </NavDropdown>
                            <NavDropdown title="Sự Kiện" id="basic-nav-dropdown">
                                <NavDropdown.Item href="#action3" >Sảnh Tiệc</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action3" >Thực Đơn</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action3" >Dịch Vụ</NavDropdown.Item>
                            </NavDropdown>
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
        </>
    )
}
export default Header;