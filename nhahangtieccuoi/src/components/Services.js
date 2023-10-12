import { useContext, useEffect, useState } from "react";
import { Alert, Button, Card, Col, Pagination, Row, Toast } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { useSearchParams } from "react-router-dom";
import { MyCartContext } from "../App";
import cookie from "react-cookies";

const Services = () => {
    const [, cartdispatch] = useContext(MyCartContext);
    const [services, setServices] = useState(null);
    const [q] = useSearchParams();
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(50);
    const [showAddToCartToast, setShowAddToCartToast] = useState(false);

    useEffect(() => {
        let loadServices = async () => {
            try {
                let e = endpoints['services'];

                let kw = q.get("kw");
                if (kw !== null) {
                    e = `${e}?kw=${kw}`;
                }
                let res = await Apis.get(e);
                setServices(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }
        loadServices();
    }, [q])

    useEffect(() => {
        const handleScroll = () => {
            const toast = document.querySelector(".toast");
            if (toast) {
                const scrollY = window.scrollY;
                toast.style.top = `${scrollY}px`;
            }
        };

        window.addEventListener("scroll", handleScroll);

        return () => {
            window.removeEventListener("scroll", handleScroll);
        };
    }, []);

    const handlePageChange = (pageNumber) => {
        setCurrentPage(pageNumber);
    };

    const handleItemsPerPageChange = (e) => {
        const newItemsPerPage = parseInt(e.target.value);
        setItemsPerPage(newItemsPerPage);
        setCurrentPage(1);
    };

    const order = (service) => {

        let cart = cookie.load("cart") || null;
        if (cart === null) {
            cart = {}
        }
        if (!(service.serviceName in cart)) {
            cartdispatch({
                type: "inc",
                payload: 1
            });
            cart[service.serviceName] = {
                "id": service.id,
                "serviceId": service.id,
                "name": service.serviceName,
                "quantity": 1,
                "unitPrice": service.servicePrice
            }
        } else {
            // cart[service.id][`quantity`] += 1;
            cartdispatch({
                type: "inc",
                payload: 0
            });
        }
        cookie.save(`cart`, cart);
        setShowAddToCartToast(true);
        console.info(cart);
    }
    if (services === null) {
        return <MySpinner />
    }
    if (services.length === 0) {
        return <Alert variant="info" className="mt-5">Không có dịch vụ nào!!</Alert>
    }
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentServices = services.slice(startIndex, endIndex);
    return (
        <>
            <Toast
                show={showAddToCartToast}
                onClose={() => setShowAddToCartToast(false)}
                autohide
                delay={2000}
                style={{
                    position: 'fixed',
                    top: 100,
                    zIndex: 1000,
                }}
            >
                <Toast.Header>
                    <strong className="mr-auto">Thông báo</strong>
                </Toast.Header>
                <Toast.Body className="text-success">Dịch vụ đã được thêm vào giỏ hàng thành công!!!</Toast.Body>
            </Toast>
            <h1 className="text-center text-info">Dịch Vụ</h1>
            <div className="mb-2">
                <label htmlFor="itemsPerPageSelect" className="mr-2">Số dịch vụ trên mỗi trang:</label>
                <select id="itemsPerPageSelect" onChange={handleItemsPerPageChange} value={itemsPerPage}>
                    <option value="5">5</option>
                    <option value="8">8</option>
                    <option value="50">Tất cả</option>
                </select>
            </div>
            <Pagination>
                {Array.from({ length: Math.ceil(services.length / itemsPerPage) }, (_, index) => (
                    <Pagination.Item
                        active={index + 1 === currentPage}
                        onClick={() => handlePageChange(index + 1)}
                    >
                        {index + 1}
                    </Pagination.Item>
                ))}
            </Pagination>
            <Row>
                {currentServices.map(s => (
                    <Col xs={12} md={3} className="mt-2" key={s.serviceId}>
                        <Card style={{ height: '100%' }}>
                            <Card.Img variant="top" src={s.serviceImage} height={200} width={100} />
                            <Card.Body>
                                <Card.Title>{s.serviceName}</Card.Title>
                                <Card.Text>{new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(s.servicePrice)}</Card.Text>
                                <Card.Text>{s.serviceDescription}</Card.Text>
                                {s.status === 'Sẵn sàng' ? (
                                    <Card.Text>{s.status} &#128994;</Card.Text>
                                ) : <Card.Text>{s.status} &#128992;</Card.Text>}
                                {s.status === 'Sẵn sàng' ? (
                                    <Button variant="primary" onClick={() => order(s)}>Thêm</Button>
                                ) : null}
                            </Card.Body>
                        </Card>
                    </Col>
                ))}
            </Row>
            {/* <div className="container">
                <div className="row">
                    <div className="col-md-12">
                        <div className="dịch-vụ">
                            <div className="before-service">
                                <h1 className="service-title text-center">MENU</h1>
                            </div>
                            <div className="service-content">
                                <ul className="list-group">
                                    {services.map((s, index) => (
                                        <li key={index} className="list-group-item">
                                            <div className="row align-items-center">
                                                <div className="col-1">
                                                    <h8 className="stt">{index + 1}</h8>
                                                </div>
                                                <div className="col-3">
                                                    <img src={s.serviceImage} alt={s.serviceName} width="200" height="100" />
                                                </div>
                                                <div className="col-3">
                                                    <h5 className="name">{s.serviceName}</h5>
                                                </div>
                                                <div className="col-2">
                                                    <p className="price">{s.servicePrice} VND</p>
                                                </div>
                                                <div className="col-2">
                                                    <p className="price">{s.serviceDescription} VND</p>
                                                </div>
                                                <div className="col-1 text-right">
                                                    <input
                                                        className="form-check-input"
                                                        type="checkbox"
                                                        id={`menu_dish_${s.id}`}
                                                        value={s.servicePrice}
                                                        name={`menu_dish_${s.id}`}
                                                        data-ten={s.serviceName}
                                                        data-gia={s.servicePrice}
                                                    />
                                                    <span className="active-check"></span>
                                                </div>
                                            </div>
                                        </li>


                                    ))}
                                </ul>
                                <div className="after-menu">
                                    <p className="text-note">
                                        <span className="text-danger">Lưu ý:</span> Quý khách có thể kết hợp nhiều dịch vụ với nhau nếu có nhu cầu.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> */}
        </>
    )
}
export default Services;