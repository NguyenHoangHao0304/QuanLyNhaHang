import { useContext, useEffect, useState } from "react";
import { Alert, Button, Form, Table } from "react-bootstrap";
import cookie from "react-cookies";
import { MyCartContext, MyUserContext } from "../App";
import { Link } from "react-router-dom";
import Apis, { authApi, endpoints } from "../configs/Apis";

const Cart = () => {
    const [user] = useContext(MyUserContext);
    const [, cartDispatch] = useContext(MyCartContext);
    const [carts, setCarts] = useState(cookie.load("cart") || {});
    const [bookingDate, setBookingDate] = useState();
    const [startTime, setStartTime] = useState();
    const [bookingName, setBookingName] = useState();
    const [paymentMethod, setPaymentMethod] = useState();
    const [tableNumber, setTableNumber] = useState();
    // const [hallId, setHallId] = useState(null);
    const [booking, setBooking] = useState(null);
    // const [hall, setHall] = useState(null);
    const [totalPrice, setTotalPrice] = useState();

    useEffect(() => {
        const loadBooking = async () => {
            try {
                let { data } = await Apis.get(endpoints[`bookings`]);
                setBooking(data);
            } catch (error) {
                console.error(error);
            }
        };
        // let loadHall = async () => {
        //     try {
        //         let e = endpoints['halls'];
        //         let res = await Apis.get(e);
        //         setHall(res.data);
        //     } catch (ex) {
        //         console.error(ex);
        //     }
        // }
        // loadHall();
        loadBooking();
    }, []);

    const calculateTotalPrice = () => {
        let total = 0;
        if (carts) {
            Object.values(carts).forEach((cartItem) => {
                total += cartItem.unitPrice * cartItem.quantity;
            });
        }
        return total;
    };

    useEffect(() => {
        const total = calculateTotalPrice();
        setTotalPrice(total);
    }, [carts]);

    const deleteItem = (item) => {
        let cart = cookie.load("cart") || null;
        if (cart !== null) {
            if (item.name in cart) {
                cartDispatch({
                    type: "dec",
                    payload: cart[item.name]["quantity"],
                });
                delete cart[item.name];
                cookie.save("cart", cart);
                setCarts(cart);
                console.info(cart);
            }
        }
    };

    const updateItem = () => {
        cookie.save("cart", carts);

        let sum = Object.values(carts).reduce(
            (init, current) => init + current["quantity"],
            0
        );
        cartDispatch({ type: "update", payload: sum });
    };

    const pay = () => {
        const process = async () => {
            try {
                const dataToSend = {
                    carts: carts,
                    // hallId: hallId,
                    bookingName: bookingName,
                    bookingDate: bookingDate,
                    startTime: startTime,
                    paymentMethod: paymentMethod,
                    tableNumber: tableNumber,
                    totalPrice: totalPrice
                };
                const res = await authApi().post(endpoints[`pay`], dataToSend);

                if (res.status === 200) {
                    cookie.remove("cart");

                    cartDispatch({
                        type: "update",
                        pay: 0,
                    });
                    setCarts(null);
                }
                setBooking([...booking, res.data]);
            } catch (error) {
                console.error(error);
            }

            // let { data } = await authApi().post(endpoints[`add-booking`], {
            //     // "bookingDate": bookingDate,
            //     // "startTime": startTime,
            //     "bookingName": bookingName,
            //     "hallId": hallId
            // });
            // setBooking([...booking, data]);
        };
        process();
    };

    if (carts === null && paymentMethod === "Thanh toán TRỰC TIẾP") {
        return (
            <Alert variant="info" className="mt-5">
                Bạn đã đặt tiệc thành công và nhớ thanh toán trực tiếp tại quầy khi đến
                ngày tổ chức!!!
            </Alert>
        );
    }
    if (carts === null && paymentMethod === "Thanh toán qua ví MOMO") {
        return (
            <Alert variant="info" className="mt-5 text-center">
                {" "}
                <h3>QUÉT MÃ ĐỂ THANH TOÁN</h3> <br />
                <img
                    src="https://res.cloudinary.com/drqfqkwfo/image/upload/v1695753097/381453333_989024882177613_4617760921413331015_n_zc7rdc.jpg"
                    alt="QR MOMO"
                    height={600}
                    width={600}
                />
                <br />
                <strong className="text-danger mt-5">Lưu ý:</strong> Quý khách vui lòng
                chụp lại minh chứng đã thanh toán !!!{" "}
                <strong>
                    <a
                        href="https://docs.google.com/forms/d/1MPshBCV26gE2jRMqn3wz7LGhisLL9NrOBhkKLZQWL0U/edit"
                        target="_blank"
                        rel="noopener noreferrer"
                    >
                        Gửi minh chứng tại đây
                    </a>
                </strong>
            </Alert>
        );
    }
    if (carts === null && paymentMethod === "Thanh toán qua ZALOPAY") {
        return (
            <Alert variant="info" className="mt-5 text-center">
                {" "}
                <h3>QUÉT MÃ ĐỂ THANH TOÁN </h3>
                <br />
                <img
                    src="https://res.cloudinary.com/drqfqkwfo/image/upload/v1695753097/384296077_2097408980606384_6077507150543085824_n_tjy2a2.jpg"
                    alt="QR ZALOPAY"
                    height={600}
                    width={600}
                />
                <br />
                <strong className="text-danger mt-5">Lưu ý:</strong> Quý khách vui lòng
                chụp lại minh chứng đã thanh toán !!!{" "}
                <strong>
                    <a
                        href="https://docs.google.com/forms/d/1MPshBCV26gE2jRMqn3wz7LGhisLL9NrOBhkKLZQWL0U/edit"
                        target="_blank"
                        rel="noopener noreferrer"
                    >
                        Gửi minh chứng tại đây
                    </a>
                </strong>
            </Alert>
        );
    }

    return (
        <>
            <h1 className="text-center text-info mt-2">GIỎ HÀNG</h1>
            <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>#</th>
                        {/* <th>FoodId</th>
                    <th>ServiceId</th>
                    <th>HallId</th> */}
                        <th>Tên</th>
                        <th>Giá Tiền</th>
                        <th>Số lượng</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {Object.values(carts).map((c) => {
                        return (
                            <tr>
                                <td></td>
                                {/* <td>{c.foodId}</td>
                        <td>{c.serviceId}</td>
                        <td>{c.hallId}</td> */}
                                <td>{c.name}</td>
                                <td>{new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(c.unitPrice)}</td>
                                <td>
                                    <Form.Control
                                        type="number"
                                        onBlur={updateItem}
                                        value={carts[c.name]["quantity"]}
                                        onChange={(e) =>
                                            setCarts({
                                                ...carts,
                                                [c.name]: {
                                                    ...carts[c.name],
                                                    quantity: parseInt(e.target.value),
                                                },
                                            })
                                        }
                                    />
                                </td>
                                <td>
                                    <Button variant="danger" onClick={() => deleteItem(c)}>
                                        &times;
                                    </Button>
                                </td>
                            </tr>
                        );
                    })}
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <p className=" text-secondary mt-0" >Tổng Tiền: {new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalPrice)}</p>
                    </tr>
                </tfoot>
            </Table>
            {/* <h6 className=" text-secondary mt-0 float-end" >Tổng Tiền: {totalPrice} VND</h6> */}
            <div className="bg">
                <div className="container ">
                    <strong><h4 className="text-center text-black mt-5 pt-4">Thông tin đặt tiệc</h4></strong>
                    <Form className="mt-2">
                        <Form.Group className="mb-4">
                            <Form.Label><strong>Ngày tổ chức</strong></Form.Label>
                            <Form.Control
                                type="date"
                                value={bookingDate}
                                onChange={(e) => setBookingDate(e.target.value)}
                            />
                        </Form.Group>
                        <Form.Group className="mb-4">
                            <Form.Label><strong>Giờ bắt đầu</strong></Form.Label>
                            <Form.Control
                                type="text"
                                placeholder="Giờ bắt đầu"
                                value={startTime}
                                onChange={(e) => setStartTime(e.target.value)}
                            />
                        </Form.Group>
                        <Form.Group className="mb-4">
                            <Form.Label><strong>Tên Tiệc</strong></Form.Label>
                            <Form.Control
                                type="text"
                                placeholder="Dạng Tiệc"
                                value={bookingName}
                                onChange={(e) => setBookingName(e.target.value)}
                            />
                        </Form.Group>
                        <Form.Group className="mb-4">
                            <Form.Label><strong>Số lượng bàn</strong></Form.Label>
                            <Form.Control
                                type="number"
                                placeholder="Số Lượng Bàn"
                                value={tableNumber}
                                onChange={(e) => setTableNumber(e.target.value)}
                            />
                        </Form.Group>
                        <Form.Group className="mb-4 pb-4">
                            <Form.Label><strong>Phương Thức Thanh Toán</strong></Form.Label>
                            <Form.Select
                                aria-label="Default select example"
                                value={paymentMethod}
                                onChange={(e) => setPaymentMethod(e.target.value)}
                            >
                                <option></option>
                                <option>Thanh toán TRỰC TIẾP</option>
                                <option>Thanh toán qua ví MOMO</option>
                                <option>Thanh toán qua ZALOPAY</option>
                            </Form.Select>
                        </Form.Group>
                    </Form>
                </div>
            </div>
            {user === null ? (
                <p>
                    Vui lòng <Link to="/login?next=/cart">đăng nhập</Link> để đặt tiệc
                </p>
            ) : (
                <Button onClick={pay} variant="info mt-2 mb-3">
                    Đặt Tiệc
                </Button>
            )}
        </>
    );
};

export default Cart;
