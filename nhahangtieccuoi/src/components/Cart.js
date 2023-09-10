import { useContext, useEffect, useState } from "react";
import { Alert, Button, Form, Table } from "react-bootstrap";
import cookie from "react-cookies";
import { MyCartContext, MyUserContext } from "../App";
import { Link } from "react-router-dom";
import Apis, { authApi, endpoints } from "../configs/Apis";

const Cart = () => {
    const [user,] = useContext(MyUserContext);
    const [, cartDispatch] = useContext(MyCartContext);
    const [carts, setCarts] = useState(cookie.load("cart") || {});
    // const [bookingDate, setBookingDate] = useState();
    // const [startTime, setStartTime] = useState();
    const [bookingName, setBookingName] = useState();
    const [hallId, setHallId] = useState();
    const [booking, setBooking] = useState(null);
    const [hall, setHall] = useState(null);

    useEffect(() => {
        const loadBooking = async () => {
            try {
                let { data } = await Apis.get(endpoints[`bookings`]);
                setBooking(data);
            } catch (error) {
                console.error(error);
            }
        }
        let loadHall = async () => {
            try {
                let e = endpoints['halls'];
                let res = await Apis.get(e);
                setHall(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }
        loadHall();
        loadBooking();
    }, [])

    const deleteItem = (item) => {
        let cart = cookie.load("cart") || null;
        if (cart !== null) {
            if (item.name in cart) {
                cartDispatch({
                    "type": "dec",
                    "payload": cart[item.name]["quantity"]
                })
                delete cart[item.name];
                cookie.save("cart", cart);
                setCarts(cart);
                console.info(cart);
            }
        }
    }

    const updateItem = () => {
        cookie.save("cart", carts);

        let sum = Object.values(carts).reduce((init, current) => init + current["quantity"], 0)
        cartDispatch({ "type": "update", "payload": sum });
    }

    const pay = () => {
        const process = async () => {
            let res = await authApi().post(endpoints[`pay`], carts);
            if (res.status === 200) {
                cookie.remove("cart");

                cartDispatch({
                    "type": "update",
                    "pay": 0
                });
                setCarts(null);
            }

            let { data } = await authApi().post(endpoints[`add-booking`], {
                // "bookingDate": bookingDate,
                // "startTime": startTime,
                "bookingName": bookingName,
                "hallId": hallId
            });
            setBooking([...booking, data]);
        }
        process();
    }

    if (carts === null) {
        return <Alert variant="info" className="mt-5">Không có sản phẩm trong giỏ !!!</Alert>
    }

    return <>
        <h1 className="text-center text-info mt-2">GIỎ HÀNG</h1>
        <Table striped bordered hover>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Tên</th>
                    <th>Giá Tiền</th>
                    <th>Số lượng</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {Object.values(carts).map(c => {
                    return <tr>
                        <td></td>
                        <td>{c.name}</td>
                        <td>{c.unitPrice} VND</td>
                        <td>
                            <Form.Control type="number" onBlur={updateItem} value={carts[c.name]["quantity"]} onChange={e => setCarts({ ...carts, [c.name]: { ...carts[c.name], "quantity": parseInt(e.target.value) } })} />
                        </td>
                        <td>
                            <Button variant="danger" onClick={() => deleteItem(c)}>&times;</Button>
                        </td>
                    </tr>
                })}

            </tbody>
        </Table>
        <h5 className="text-center text-warning mt-5">Thông tin cần thiết</h5>
        <Form className="mt-1">
            {/* <Form.Group className="mb-3" >
                <Form.Label>Ngày tổ chức</Form.Label>
                <Form.Control type="date" placeholder="Ngày tổ chức" value={bookingDate} onChange={(e) => setBookingDate(e.target.value)} />
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Giờ bắt đầu</Form.Label>
                <Form.Control type="text" placeholder="Giờ bắt đầu" value={startTime} onChange={(e) => setStartTime(e.target.value)} />
            </Form.Group> */}
            <Form.Group className="mb-3" >
                <Form.Label>Tên Tiệc</Form.Label>
                <Form.Control type="text" placeholder="Dạng Tiệc" value={bookingName} onChange={(e) => setBookingName(e.target.value)} />
            </Form.Group>
            <Form.Group className="mb-3" >
                <Form.Label>Sảnh</Form.Label>
                <Form.Select aria-label="Default select example" value={hallId} onChange={(e) => setHallId(e.target.value)}>
                    {hall && hall.map(h => (
                        <option value={h.id}>{h.hallName} - {h.branchId.branchName}</option>
                    ))}
                </Form.Select>
            </Form.Group>
        </Form>
        {user === null ? <p>Vui lòng <Link to="/login?next=/cart">đăng nhập</Link> để thanh toán</p> : <Button onClick={pay} variant="info mt-2 mb-3">Thanh Toán</Button>}

    </>
}

export default Cart;
