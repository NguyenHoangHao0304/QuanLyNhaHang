import { useContext, useEffect, useState } from "react";
import { Alert, Button, Card, Col, Pagination, Row, Toast } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { useSearchParams } from "react-router-dom";
import { MyCartContext } from "../App";
import cookie from "react-cookies";

const Foods = () => {
    const [, cartdispatch] = useContext(MyCartContext);
    const [foods, setFoods] = useState(null);
    const [q] = useSearchParams();
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(100);
    const [showAddToCartToast, setShowAddToCartToast] = useState(false);

    useEffect(() => {
        let loadFoods = async () => {
            try {
                let e = endpoints['foods'];

                let kw = q.get("kw");
                if (kw !== null) {
                    e = `${e}?kw=${kw}`;
                }
                let res = await Apis.get(e);
                setFoods(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }

        loadFoods();
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
    // useEffect(() => {
    //     if (foods !== null) {
    //         foods.forEach((food) => {
    //             const checkbox = document.getElementById(`menu_dish_${food.id}`);
    //             const isChecked = cookie.load(`checkbox_${food.id}`) === "true"; 

    //             checkbox.checked = isChecked;
    //         });
    //     }
    // }, [foods]);

    const order = (food) => {
        cartdispatch({
            type: "inc",
            payload: 1
        });

        let cart = cookie.load("cart") || null;
        if (cart === null) {
            cart = {}
        }
        if (!(food.foodName in cart)) {
            cart[food.foodName] = {
                "id": food.id,
                "foodId": food.id,
                "name": food.foodName,
                "quantity": 1,
                "unitPrice": food.foodPrice
            }
        } else {
            cart[food.foodName][`quantity`] += 1;
        }
        cookie.save(`cart`, cart);
        setShowAddToCartToast(true);
        console.info(cart);

        // let cart = cookie.load("cart") || {};

        // const checkbox = document.getElementById(`menu_dish_${food.id}`);
        // const isChecked = checkbox.checked;

        // if (isChecked) {
        //     if (!(food.id in cart)) {
        //         cart[food.id] = {
        //             "id": food.id,
        //             "name": food.foodName,
        //             "unitPrice": food.foodPrice,
        //             "quantity" : 1
        //         };

        //         cartdispatch({
        //             type: "inc",
        //             payload: 1
        //         });
        //     }
        // } else {
        //     if (food.id in cart) {
        //         delete cart[food.id];

        //         cartdispatch({
        //             type: "dec",
        //             payload: 1
        //         });
        //     }
        // }
        // cookie.save(`checkbox_${food.id}`, isChecked);
    }
    if (foods === null) {
        return <MySpinner />
    }
    if (foods.length === 0) {
        return <Alert variant="info" className="mt-5">Không có món ăn nào!!</Alert>
    }
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentFoods = foods.slice(startIndex, endIndex);

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
                <Toast.Body className="text-success">Thức ăn đã được thêm vào giỏ hàng thành công!!!</Toast.Body>
            </Toast>
            <h1 className="text-center text-info">Thực Đơn</h1>
            <div className="mb-2">
                <label htmlFor="itemsPerPageSelect" className="mr-2">Số món ăn trên mỗi trang:</label>
                <select id="itemsPerPageSelect" onChange={handleItemsPerPageChange} value={itemsPerPage}>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="100">Tất cả</option>
                </select>
            </div>
            <Pagination>
                {Array.from({ length: Math.ceil(foods.length / itemsPerPage) }, (_, index) => (
                    <Pagination.Item
                        active={index + 1 === currentPage}
                        onClick={() => handlePageChange(index + 1)}
                    >
                        {index + 1}
                    </Pagination.Item>
                ))}
            </Pagination>
            <Row>
                {currentFoods.map(f => {
                    return <Col xs={12} md={3} className="mt-2">
                        <Card style={{ height: '100%' }}>
                            <Card.Img variant="top" src={f.foodImage} height={200} width={100} />
                            <Card.Body>
                                <Card.Title>{f.foodName}</Card.Title>
                                <Card.Text>{new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(f.foodPrice)}</Card.Text>
                                {f.status === 'Còn Hàng' ? (
                                    <Card.Text>{f.status} &#128994;</Card.Text>
                                ) : <Card.Text>{f.status} &#128992;</Card.Text>}
                                {f.status === 'Còn Hàng' ? (
                                    <Button variant="primary" onClick={() => order(f)}>Thêm </Button>
                                ) : null}
                            </Card.Body>
                        </Card>
                    </Col>
                })}
            </Row>
            {/* <div className="container">
                <div className="row">
                    <div className="col-md-12">
                        <div className="thuc-don">
                            <div className="before-menu">
                                <h1 className="menu-title text-info text-center">MENU</h1>
                            </div>
                            <div className="menu-content">
                                <ul className="list-group">
                                    {foods.map((food, index) => (
                                        <li key={index} className="list-group-item">
                                            <div className="row align-items-center">
                                                <div className="col-1">
                                                    <h8 className="stt">{index + 1}</h8>
                                                </div>
                                                <div className="col-4">
                                                    <img src={food.foodImage} alt={food.foodName} width="200" height="100" />
                                                </div>
                                                <div className="col-4">
                                                    <h5 className="name">{food.foodName}</h5>
                                                </div>
                                                <div className="col-2">
                                                    <p className="price">{food.foodPrice} VND</p>
                                                </div>
                                                <div className="col-1 text-right" >
                                                    <input onClick={() => order(food)}
                                                        className="form-check-input"
                                                        type="checkbox"
                                                        id={`menu_dish_${food.id}`}
                                                        value={food.foodPrice}
                                                        name={`menu_dish_${food.id}`}
                                                        data-ten={food.foodName}
                                                        data-gia={food.foodPrice}
                                                    />
                                                    <span className="active-check"></span>
                                                </div>
                                            </div>
                                        </li>


                                    ))}
                                </ul>
                                <div className="after-menu">
                                    <p className="text-note">
                                        <span className="text-danger">Lưu ý:</span> Quý khách có thể kết hợp món với nhau để thêm vào tiệc.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> */}
        </>
    );
};
export default Foods;