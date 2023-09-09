import { useContext, useState } from "react";
import { Alert, Button, Form, Table } from "react-bootstrap";
import cookie from "react-cookies";
import { MyCartContext, MyUserContext } from "../App";
import { Link } from "react-router-dom";
import { authApi, endpoints } from "../configs/Apis";

const Cart = () => {
    const [user,] = useContext(MyUserContext);
    const [, cartDispatch] = useContext(MyCartContext);
    const [carts, setCarts] = useState(cookie.load("cart") || {});

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
            let res = await authApi().post(endpoints[`pay`],carts);
            if(res.status === 200){
                cookie.remove("cart");

                cartDispatch({
                    "type": "update",
                    "pay": 0
                });
                setCarts(null);
            }
        }
        process();
    }

    if(carts === null){
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
                            <Form.Control type="number" onBlur={updateItem} value={carts[c.name]["quantity"]} onChange={e => setCarts({ ...carts, [c.name]: { ...carts[c.name], "quantity": parseInt(e.target.value)}})} />
                        </td>
                        <td>
                            <Button variant="danger" onClick={() => deleteItem(c)}>&times;</Button>
                        </td>
                    </tr>
                })}

            </tbody>
        </Table>
        {user === null ?<p>Vui lòng <Link to="/login?next=/cart">đăng nhập</Link> để thanh toán</p>:<Button onClick={pay} variant="info mt-2 mb-3">Thanh Toán</Button>}

    </>
}

export default Cart;