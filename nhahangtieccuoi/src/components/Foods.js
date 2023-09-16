import { useContext, useEffect, useState } from "react";
import { Alert, Button, Card, Col, Row } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { useSearchParams } from "react-router-dom";
import { MyCartContext } from "../App";
import cookie from "react-cookies";

const Foods = () => {
    const [, cartdispatch] = useContext(MyCartContext);
    const [foods, setFoods] = useState(null);
    const [q] = useSearchParams();


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
                "foodId":food.id,
                "name": food.foodName,
                "quantity": 1,
                "unitPrice": food.foodPrice
            }
        } else {
            cart[food.foodName][`quantity`] += 1;
        }
        cookie.save(`cart`, cart);
        console.info(cart);

        // let cart = cookie.load("cart") || {};

        // const checkbox = document.getElementById(`menu_dish_${food.id}`);
        // const isChecked = checkbox.checked;

        // if (isChecked) {
        //     // Checkbox đã được chọn
        //     if (!(food.id in cart)) {
        //         // Món ăn chưa tồn tại trong giỏ hàng, thêm nó vào
        //         cart[food.id] = {
        //             "id": food.id,
        //             "name": food.foodName,
        //             "unitPrice": food.foodPrice,
        //             "quantity" : 1
        //         };

        //         // Tăng giá trị trong giỏ hàng
        //         cartdispatch({
        //             type: "inc",
        //             payload: 1
        //         });
        //     }
        // } else {
        //     // Checkbox bị bỏ chọn
        //     if (food.id in cart) {
        //         // Món ăn tồn tại trong giỏ hàng, loại bỏ nó
        //         delete cart[food.id];

        //         // Giảm giá trị trong giỏ hàng
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
    return (
        <>
            <h1 className="text-center text-info">Thực Đơn</h1>
            <Row>
                {foods.map(f => {
                    return <Col xs={12} md={3} className="mt-2">
                        <Card style={{ height: '100%' }}>
                            <Card.Img variant="top" src={f.foodImage} height={200} width={100} />
                            <Card.Body>
                                <Card.Title>{f.foodName}</Card.Title>
                                <Card.Text>{f.foodPrice} VNĐ</Card.Text>
                                <Button variant="primary" onClick={() => order(f)}>Thêm </Button>
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