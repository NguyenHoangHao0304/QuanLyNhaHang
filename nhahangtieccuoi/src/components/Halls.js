import { useEffect, useState } from "react";
import { Alert, Card, Col, Pagination, Row } from "react-bootstrap";
import MySpinner from "../layout/MySpinner";
import Apis, { endpoints } from "../configs/Apis";
import { Link, useSearchParams } from "react-router-dom";

const Halls = () => {
    const [halls, setHalls] = useState(null);
    const [q] = useSearchParams();
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(50);
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
    const handlePageChange = (pageNumber) => {
        setCurrentPage(pageNumber);
    };

    const handleItemsPerPageChange = (e) => {
        const newItemsPerPage = parseInt(e.target.value);
        setItemsPerPage(newItemsPerPage);
        setCurrentPage(1);
    };
    if (halls === null) {
        return <MySpinner />
    }
    if (halls.length === 0) {
        return <Alert variant="info" className="mt-5">Không có món ăn nào!!</Alert>
    }
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentHalls = halls.slice(startIndex, endIndex);
    return (
        <>
            <h1 className="text-center text-info">Sảnh Cưới</h1>
            <div className="mb-2">
                <label htmlFor="itemsPerPageSelect" className="mr-2">Số sảnh trên mỗi trang:</label>
                <select id="itemsPerPageSelect" onChange={handleItemsPerPageChange} value={itemsPerPage}>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="50">Tất cả</option>
                </select>
            </div>
            <Pagination>
                {Array.from({ length: Math.ceil(halls.length / itemsPerPage) }, (_, index) => (
                    <Pagination.Item
                        active={index + 1 === currentPage}
                        onClick={() => handlePageChange(index + 1)}
                    >
                        {index + 1}
                    </Pagination.Item>
                ))}
            </Pagination>
            <Row>
                {currentHalls.map(h => {
                     let hallDetailLink = `/halls/${h.id}`;
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