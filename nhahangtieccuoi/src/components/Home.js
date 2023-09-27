import { useEffect, useState } from "react";
import { Card, Col, Row } from "react-bootstrap";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";
import { Link } from "react-router-dom";

const Home = () => {
    const [branchs, setBranchs] = useState(null);
    useEffect(() => {
        const loadBranchs = async () => {
            let res = await Apis.get(endpoints['branchs']);
            setBranchs(res.data);
        }
        loadBranchs();
    }, [])

    if (branchs === null) {
        return <MySpinner />
    }
    return (
        <>
            <h1 className="text-center text-info">Danh Sách Chi Nhánh</h1>
            <Row>
                {branchs.map(b => {
                    let branchDetailLink = `/branchs/${b.id}`;
                    return <Col xs={12} md={3} className="mt-3">
                        <Card style={{ height: '100%' }}>
                            <Card.Img variant="top" src="https://res.cloudinary.com/drqfqkwfo/image/upload/v1691435747/osqbj4rsvciiycykxetv.png" height={200} width={100} />
                            <Card.Body>
                                <Card.Title>{b.branchName}</Card.Title>
                                <Card.Text>{b.branchAddress}</Card.Text>
                                <Link to={branchDetailLink} className="btn btn-primary mt-2">Xem Chi Tiết</Link>
                            </Card.Body>
                        </Card>
                    </Col>
                })}
            </Row>
        </>
    )
}
export default Home;