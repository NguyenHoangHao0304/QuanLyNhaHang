import { useEffect, useState } from "react";
import { Alert, Card, Col, Row } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { Link, useSearchParams } from "react-router-dom";

const Halls = () => {
    const [halls, setHalls] = useState(null);
    const [q] = useSearchParams();
    useEffect(() => {
        let loadHalls = async () => {
            try {
                let e = endpoints['halls'];

                let kw = q.get("kw");
                if (kw !== null) {
                    e = `${e}?kw=${kw}`;
                }
                let res = await Apis.get(e);
                setHalls(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }
        loadHalls();
    }, [q])
    if (halls === null) {
        return <MySpinner />
    }
    if (halls.length === 0) {
        return <Alert variant="info" className="mt-5">Không có món ăn nào!!</Alert>
    }
    return (
        <>
            <h1 className="text-center text-info">Sảnh Cưới</h1>
            <Row>
                {halls.map(h => {
                     const hallDetailLink = `/halls/${h.id}`;
                    return <Col xs={12} md={3} className="mt-2">
                        <Card >
                            <Card.Img variant="top" src={h.hallImage} height={200} width={100} />
                            <Card.Body>
                                <Card.Title>{h.hallName}</Card.Title>
                                <Card.Text>Sức Chứa: {h.capacity} Người</Card.Text>
                                <Card.Text>{h.branchId.branchName}</Card.Text>
                                <Link to={hallDetailLink} className="btn btn-primary">Xem Chi Tiết</Link>
                            </Card.Body>
                        </Card>
                    </Col>
                })}
            </Row>
        </>
    )
}
export default Halls;