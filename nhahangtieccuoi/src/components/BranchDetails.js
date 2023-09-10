import { useContext, useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import MySpinner from "../layout/MySpinner";
import Apis, { authApi, endpoints } from "../configs/Apis";
import { Button, Card, Form, ListGroup } from "react-bootstrap";
import Moment from "react-moment";
import { MyUserContext } from "../App";

const BranchDetails = () => {
    const [user,] = useContext(MyUserContext);
    const { branchId } = useParams();
    const [branch, setBranch] = useState(null);
    const [feedback, setFeedback] = useState(null);
    const [content, setContent] = useState();

    useEffect(() => {
        const loadBranch = async () => {
            try {
                let { data } = await Apis.get(endpoints['branch'](branchId));
                setBranch(data);
            } catch (error) {
                console.error(error);
            }
        }

        const loadFeedback = async () => {
            try {
                let { data } = await Apis.get(endpoints['feedbacks'](branchId));
                setFeedback(data);
            } catch (error) {
                console.error(error);
            }
        }

        loadBranch();
        loadFeedback();
    }, [branchId])

    const addFeedback = () => {
        const process = async () => {
            let { data } = await authApi().post(endpoints[`add-feedback`], {
                "feedbackDescription": content,
                "branchId": branch.id
            });
            setFeedback([...feedback, data]);
        }

        process();
    }
    // useEffect(() => {
    //     let loadBranchDetails = async () => {
    //         try {
    //             let e = `${endpoints.branch.replace('{id}', id)}`;

    //             let res = await Apis.get(e);
    //             setBranch(res.data);
    //         } catch (ex) {
    //             console.error(ex);
    //         }
    //     }
    //     loadBranchDetails();
    // }, [id]);

    if (!branch || !feedback) {
        return <MySpinner />;
    }
    let url = `/login?next=/branchs/${branchId}`;
    return <>
        <h1 className="text-center text-warning">{branch.branchName}</h1>
        <h5 className="text-center text-warning">({branch.branchAddress})</h5>
        <Card className="mt-2" style={{ width: 1350 }}>
            <Card.Header><strong>Giới thiệu về Chi Nhánh</strong></Card.Header>
            <Card.Body>
                <Card.Text>
                    <p className="text-info"> Đây là nơi tạo nên những khoảnh khắc đáng nhớ trong cuộc đời của bạn, đây là nơi mà hạnh phúc, tình yêu và niềm vui đọng mãi trong trái tim mọi người. Khi bạn bước đến {branch.branchName} này, bạn sẽ bị cuốn hút bởi không gian đẹp và sang trọng. Các sảnh được trang trí tinh tế với những bức tranh nghệ thuật và hoa tươi tạo nên không gian ấm áp và lãng mạn. Đèn trang trí và ánh sáng lung linh tạo ra một bầu không gian lôi cuốn. Không gian rộng rãi và thoải mái với bàn ghế và bố trí hợp lý để phục vụ khách mời. Nơi đây thường có sân khấu hoặc bàn nhạc để biểu diễn âm nhạc trực tiếp hoặc có thể là nơi để dự trữ tiệc cưới. Khách mời ở đây đa dạng về độ tuổi và phong cách, nhưng tất cả đều chia sẻ niềm vui và niềm hạnh phúc của bạn. Họ tham gia vào lễ kỷ niệm của bạn và là những người chứng kiến cho cuộc tình đẹp của bạn. Chi nhánh còn có một quầy bar phục vụ đồ uống và cocktail độc đáo, giúp thực khách thư giãn và thỏa mãn vị giác. Nơi đây thường cũng có các góc nhỏ để tận hưởng thức ăn nhẹ và hòa mình vào không khí vui vẻ. Và nó đây nằm tọa lạc tại {branch.branchAddress}</p>
                </Card.Text>
            </Card.Body>
        </Card>

        {user === null ? <p className="mt-3 text-center">Vui lòng <Link to={url} className="text-danger" ><strong>đăng nhập</strong></Link> để đánh giá</p> : <>
            <div className="mt-5" style={{ width: 1350 }}>
                <Form>
                    <Form.Group>
                        <Form.Control
                            as="textarea"
                            value={content}
                            onChange={(e) => setContent(e.target.value)}
                            placeholder="Nội dung đánh giá"
                            style={{ minHeight: "100px" }}
                        />
                    </Form.Group>
                    <Button className="mt-1" onClick={addFeedback} variant="info">
                        Đánh Giá
                    </Button>
                </Form>
            </div>

        </>}

        <ListGroup style={{ width: 1350 }} className="mt-3">
            {feedback.map((f) => (
                <ListGroup.Item key={f.id} className="d-flex justify-content-between align-items-center">
                    <div className="d-flex align-items-center">
                        <div className="rounded-circle overflow-hidden mr-2" style={{ width: "50px", height: "50px" }}>
                            <img
                                src={f.userId.avatar}
                                alt={`${f.userId.username}`}
                                className="w-100 h-100"
                            />
                        </div>
                        <div>
                            <strong>{f.userId.username}</strong>
                            <p className="mb-0">{f.feedbackDescription}</p>
                        </div>
                    </div>
                    <div className="text-right">
                        <small>
                            <Moment locale="vi" fromNow>
                                {f.feedbackDate}
                            </Moment>
                        </small>
                    </div>
                </ListGroup.Item>
            ))}
        </ListGroup>
    </>
}
export default BranchDetails;