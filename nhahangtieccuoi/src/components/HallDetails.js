import Apis, { endpoints } from "../configs/Apis";
import { useContext, useEffect, useState } from "react";
import MySpinner from "../layout/MySpinner";
import { useParams } from "react-router-dom";
import { MyCartContext } from "../App";
import cookie from "react-cookies";
import { Button, Card, Col, Row } from "react-bootstrap";

const HallDetails = () => {
    const { hallId } = useParams();
    const [hallDetail, setHallDetail] = useState(null);
    const [hallPrice, setHallPrice] = useState(null);
    const [selectedHall, setSelectedHall] = useState();
    const [selectedHallName, setSelectedHallName] = useState('');
    const [, cartdispatch] = useContext(MyCartContext);

    // useEffect(() => {
    //     let loadHallDetails = async () => {
    //         try {
    //             let e = `${endpoints.hall.replace('{id}', id)}`;
    //             let r = `${endpoints.hallprice.replace('{id}', id)}`;

    //             let rese = await Apis.get(e);
    //             let resr = await Apis.get(r);
    //             setHallDetail(rese.data);
    //             setHallPrice(resr.data);
    //         } catch (ex) {
    //             console.error(ex);
    //         }
    //     }
    //     loadHallDetails();
    // }, [id]);
    useEffect(() => {
        const loadHallDetails = async () => {
            try {
                let { data } = await Apis.get(endpoints['hall'](hallId));
                setHallDetail(data);
            } catch (error) {
                console.error(error);
            }
        }

        const loadHallPrices = async () => {
            try {
                let { data } = await Apis.get(endpoints['hallprice'](hallId));
                setHallPrice(data);
            } catch (error) {
                console.error(error);
            }
        }

        loadHallDetails();
        loadHallPrices();
    },[hallId]);

    const handleSelectHall = (id) => {
        setSelectedHall(id);
        // console.log(selectedHall);
        
    };

    const handleSelectHallName = (name) => {
        let cart = cookie.load("cart") || {};
        if (selectedHallName !== name) {
            if (selectedHallName in cart) {
                delete cart[selectedHallName];
                cookie.save(`cart`, cart);
            }
        }

        setSelectedHallName(name);
        // console.log(selectedHallName);

    };
    const order = (hp) => {
        let cart = cookie.load("cart") || {};

        if (selectedHall !== null) {
            const hallName = hp.hallId.hallName;
            if (!(hallName in cart)) {
                cartdispatch({
                    type: "inc",
                    payload: 1
                });
                cart[hallName] = {
                    "id": hp.id,
                    "hallId": hp.hallId.id,
                    "name": hallName,
                    "quantity": 1,
                    "unitPrice": hp.price
                };
            } else {
                cart[hallName] = {
                    "id": hp.id,
                    "hallId": hp.hallId.id,
                    "name": hallName,
                    "quantity": 1,
                    "unitPrice": hp.price
                };
                cartdispatch({
                    type: "inc",
                    payload: 0
                });
            }
            setSelectedHallName(hallName);
            // console.log(selectedHallName);
            cookie.save(`cart`, cart);
            console.info(cart);

        } else {
            console.error("Chưa chọn sảnh");
        }
        // if (cart === null) {
        //     cart = {}
        // }

        // if (!(hp.hallId.hallName in cart)) {
        //     cartdispatch({
        //         type: "inc",
        //         payload: 1
        //     });
        //     cart[hp.hallId.hallName] = {
        //         "id": hp.id,
        //         "name": hp.hallId.hallName,
        //         "quantity": 1,
        //         "unitPrice": hp.price
        //     }
        // } else {
        //     // cart[service.id][`quantity`] += 1;
        //     cart[hp.hallId.hallName] = {
        //         "id": hp.id,
        //         "name": hp.hallId.hallName,
        //         "quantity": 1,
        //         "unitPrice": hp.price
        //     }
        //     cartdispatch({
        //         type: "inc",
        //         payload: 0
        //     });
        // }
        // cookie.save(`cart`, cart);
        // console.info(cart);

        // if (selectedPriceId && selectedPriceId !== hp.timePeriod) {
        //     if (selectedPriceId in cart) {
        //         delete cart[selectedPriceId];
        //         cartdispatch({
        //             type: "dec",
        //             payload: 1
        //         });
        //     }
        // }
        // const checkbox = document.getElementById(`hall_${hp.id}`);
        // const isChecked = checkbox.checked;

        // if (isChecked) {
        //     if (!(hp.hallId.hallName in cart)) {
        //         cart[hp.hallId.hallName] = {
        //             "id": hp.id,
        //             "name": hp.hallId.hallName,
        //             "unitPrice": hp.price,
        //             "quantity": 1
        //         };

        //         cartdispatch({
        //             type: "inc",
        //             payload: 1
        //         });
        //     }
        // } else {
        //     if (hp.hallId.hallName in cart) {
        //         delete cart[hp.hallId.hallName];

        //         cartdispatch({
        //             type: "dec",
        //             payload: 1
        //         });
        //     }
        // }
        // setSelectedPriceId(hp.timePeriod);
        // cookie.save(`cart`, cart);
        // console.info(cart);

    }
    if (!hallDetail || !hallPrice) {
        return <MySpinner />;
    }

    return <>
        <div>
            <h1 className="text-center text-warning">{hallDetail.hallName}</h1>
            <h5 className="text-center text-warning">({hallDetail.branchId.branchName} - Sức chứa: {hallDetail.capacity} Người)</h5>
            <img src={hallDetail.hallImage} alt={hallDetail.hallName} />
            <Card className="mt-2" style={{ width: 1350 }}>
                <Card.Header>Giới thiệu về Sảnh</Card.Header>
                <Card.Body>
                    <Card.Title className="text-center">{hallDetail.hallName}</Card.Title>
                    <Card.Text>
                        <p className="text-info"> Đây là nơi tạo nên những khoảnh khắc đáng nhớ trong cuộc đời của bạn. Đây là nơi mà hạnh phúc, tình yêu và niềm vui đọng mãi trong trái tim mọi người. Khi bạn bước vào sảnh này, bạn sẽ bị cuốn hút bởi không gian đẹp và sang trọng. Sảnh được trang trí tinh tế với những bức tranh nghệ thuật và hoa tươi tạo nên không gian ấm áp và lãng mạn. Đèn trang trí và ánh sáng lung linh tạo ra một bầu không gian lôi cuốn. Không gian sảnh rộng rãi và thoải mái với bàn ghế và bố trí hợp lý để phục vụ khách mời. Nơi đây thường có sân khấu hoặc bàn nhạc để biểu diễn âm nhạc trực tiếp hoặc có thể là nơi để dự trữ tiệc cưới. Khách mời ở đây đa dạng về độ tuổi và phong cách, nhưng tất cả đều chia sẻ niềm vui và niềm hạnh phúc của bạn. Họ tham gia vào lễ kỷ niệm của bạn và là những người chứng kiến cho cuộc tình đẹp của bạn. Sảnh còn có một quầy bar phục vụ đồ uống và cocktail độc đáo, giúp thực khách thư giãn và thỏa mãn vị giác. Nơi đây thường cũng có các góc nhỏ để tận hưởng thức ăn nhẹ và hòa mình vào không khí vui vẻ.</p>
                    </Card.Text>
                </Card.Body>
            </Card>
            <h2 className="text-center text-warning">Giá theo buổi</h2>
            <Row>
                {hallPrice.map(hp => {
                    const isHallSelected = selectedHall === hp.id;
                    return <Col xs={12} md={3} className="mt-2" key={hp.id}>
                        <Card style={{ height: '100%' }}>
                            <Card.Img variant="top" src={hp.hallId.hallImage} height={200} width={100} />
                            <Card.Body>
                                <Card.Title className="text-center">{hp.timePeriod}</Card.Title>
                                <Card.Text className="text-center">Từ: {hp.timeStart} - Đến: {hp.timeEnd}</Card.Text>
                                <Card.Text className="text-center">Giá: {hp.price} VNĐ</Card.Text>
                                {isHallSelected ? (
                                    <p className="text-success">Đã chọn</p>
                                ) : (
                                    <Button variant="outline-success" onClick={() => {
                                        handleSelectHall(hp.id);
                                        handleSelectHallName(hp.hallId.hallName);
                                        order(hp);
                                    }}>
                                        Chọn
                                    </Button>
                                )}
                            </Card.Body>
                        </Card>
                    </Col>
                })}
            </Row>
            {/* <div >
                <ul >
                    {hallPrice.map((hp) => (
                        <li >
                            <div className="row align-items-center">
                                <div className="col-2">
                                    <p className="time_period">{hp.timePeriod}</p>
                                </div>
                                <div className="col-3">
                                    <p className="time_start">{hp.timeStart}</p>
                                </div>
                                <div className="col-3">
                                    <p className="time_end">{hp.timeEnd}</p>
                                </div>
                                <div className="col-3">
                                    <p className="price">{hp.price} VNĐ</p>
                                </div>
                                <div className="col-1 text-right" >
                                    <input
                                        onClick={() => order(hp)}
                                        className="form-check-input"
                                        type="radio"
                                        id={`hall_${hp.id}`}
                                        value={hp.price}
                                        name={`hall_${hp.id}`}
                                        data-ten={hp.hallId.hallName}
                                        data-gia={hp.price}
                                        checked={selectedPriceId === hp.timePeriod}
                                    />
                                </div>
                            </div>
                        </li>
                    ))}
                </ul>
                <div className="after-menu">
                    <p className="text-note">
                        <span className="text-danger">Lưu ý:</span> Quý khách chỉ có thể chọn 1 buổi duy nhất để tổ chức tiệc.
                    </p>
                </div>
            </div> */}
        </div>
    </>
}
export default HallDetails;