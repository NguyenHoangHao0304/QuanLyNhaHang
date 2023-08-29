import { useEffect, useState } from "react";
import { Button, Card, Col, Row } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { useSearchParams } from "react-router-dom";

const Foods = () => {
    const [foods, setFoods] = useState(null);
    const [q] = useSearchParams();
    useEffect(() => {
        let loadFoods = async () => {
            try {
                let e = endpoints['foods'];

                let kw = q.get("kw");
                if(kw !== null){
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
    if (foods === null) {
        return <MySpinner />
    }
    return (
        <>
            <h1 className="text-center text-info">Thực Đơn</h1>
            <Row>
                {foods.map(f => {
                    return <Col xs={12} md={3}  className="mt-2">
                        <Card>
                            <Card.Img variant="top" src={f.foodImage} height={200} width={100}/>
                            <Card.Body>
                                <Card.Title>{f.foodName}</Card.Title>
                                <Card.Text>{f.foodPrice}</Card.Text>
                                <Button variant="primary">Thêm</Button>
                            </Card.Body>
                        </Card>
                    </Col>
                })}
            </Row>
        </>
    )
}
export default Foods;