import { useContext, useEffect, useRef, useState } from "react";
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
  const [booking, setBooking] = useState(null);
  const [totalPrice, setTotalPrice] = useState(0);
  const [paymentSuccess, setPaymentSuccess] = useState(false);
  const [showPaymentAlert, setShowPaymentAlert] = useState(false);
  const [showPaymentError, setShowPaymentError] = useState(false);
  const paypal = useRef();

  const createPaypalOrder = (totalPrice) => {
    return window.paypal.Buttons({
      createOrder: (data, actions, err) => {
        return actions.order.create({
          intent: "CAPTURE",
          purchase_units: [
            {
              amount: {
                currency_code: "THB",
                value: totalPrice,
              },
            },
          ],
        });
      },
      onApprove: async (data, actions) => {
        const order = await actions.order.capture();
        console.log(order);
        setPaymentSuccess(true);
        setShowPaymentAlert(false);
        setShowPaymentError(false);
      },
      onError: (err) => {
        console.log(err);
        setShowPaymentError(true);
      },
    });
  };

  const handlePayWithPaypal = () => {
    if (paypal.current && !paypal.current.hasChildNodes()) {
      createPaypalOrder(totalPrice).render(paypal.current);
    } else {
      console.error("paypal.current is not a valid DOM element.");
    }
  };

  const handlePlaceOrder = () => {
    if (paymentMethod === "Thanh toán qua PAYPAL" && !paymentSuccess) {
      setShowPaymentAlert(true); 
    } else {
      pay();
    }
  };

  useEffect(() => {
    const loadBooking = async () => {
      try {
        let { data } = await Apis.get(endpoints[`bookings`]);
        setBooking(data);
      } catch (error) {
        console.error(error);
      }
    };
    loadBooking();
  }, []);

  useEffect(() => {
    const calculateTotalPrice = () => {
      let total = 0;
      if (carts) {
        Object.values(carts).forEach((cartItem) => {
          total += cartItem.unitPrice * cartItem.quantity;
        });
      }
      return total;
    };

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
        if (paypal.current) {
          paypal.current.innerHTML = "";
        }
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
    if (paypal.current) {
      paypal.current.innerHTML = "";
    }
  };

  const pay = () => {
    const process = async () => {
      try {
        const dataToSend = {
          carts: carts,
          bookingName: bookingName,
          bookingDate: bookingDate,
          startTime: startTime,
          paymentMethod: paymentMethod,
          tableNumber: tableNumber,
          totalPrice: totalPrice,
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
    };
    process();
  };

  if (carts === null && paymentMethod === "Thanh toán TRỰC TIẾP") {
    return (
      <Alert variant="info" className="mt-5">
        <h3>
          Bạn đã đặt tiệc thành công và nhớ phải thanh toán trực tiếp tại quầy
          thu ngân trước khi buổi tiệc diễn ra khoảng 12 tiếng!!!
        </h3>
      </Alert>
    );
  }
  if (carts === null && paymentMethod === "Thanh toán qua PAYPAL") {
    return (
      <Alert variant="info" className="mt-5 text-center">
        <h3>Bạn đã đặt tiệc thành công!!!</h3>
      </Alert>
    );
  }
  if (carts === null && paymentMethod === "Thanh toán qua ví MOMO") {
    return (
      <Alert variant="info" className="mt-5 text-center">
        {" "}
        <h3>
          CHÚC MỪNG KHÁCH HÀNG ĐÃ ĐẶT TIỆC THÀNH CÔNG, VUI LÒNG QUÉT MÃ ĐỂ THANH
          TOÁN !!!
        </h3>{" "}
        <br />
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
        <h3>
          CHÚC MỪNG KHÁCH HÀNG ĐÃ ĐẶT TIỆC THÀNH CÔNG, VUI LÒNG QUÉT MÃ ĐỂ THANH
          TOÁN !!!
        </h3>
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
                <td>{c.name}</td>
                <td>
                  {new Intl.NumberFormat("vi-VN", {
                    style: "currency",
                    currency: "VND",
                  }).format(c.unitPrice)}
                </td>
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
            <p className="text-secondary mt-0">
              Tổng Tiền:{" "}
              {new Intl.NumberFormat("vi-VN", {
                style: "currency",
                currency: "VND",
              }).format(totalPrice)}
            </p>
          </tr>
        </tfoot>
      </Table>
      {user === null ? (
        <p>
          Vui lòng <Link to="/login?next=/cart">đăng nhập</Link> để đặt tiệc
        </p>
      ) : (
        <div className="bg">
          <div className="container ">
            <strong>
              <h4 className="text-center text-black mt-5 pt-4">
                Thông tin đặt tiệc
              </h4>
            </strong>
            <Form className="mt-2">
              <Form.Group className="mb-4">
                <Form.Label>
                  <strong>Ngày tổ chức</strong>
                </Form.Label>
                <Form.Control
                  type="date"
                  value={bookingDate}
                  onChange={(e) => setBookingDate(e.target.value)}
                />
              </Form.Group>
              <Form.Group className="mb-4">
                <Form.Label>
                  <strong>Giờ bắt đầu</strong>
                </Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Giờ bắt đầu"
                  value={startTime}
                  onChange={(e) => setStartTime(e.target.value)}
                />
              </Form.Group>
              <Form.Group className="mb-4">
                <Form.Label>
                  <strong>Loại Tiệc</strong>
                </Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Loại Tiệc"
                  value={bookingName}
                  onChange={(e) => setBookingName(e.target.value)}
                />
              </Form.Group>
              <Form.Group className="mb-4">
                <Form.Label>
                  <strong>Số lượng bàn</strong>
                </Form.Label>
                <Form.Control
                  type="number"
                  placeholder="Số Lượng Bàn"
                  value={tableNumber}
                  onChange={(e) => setTableNumber(e.target.value)}
                />
              </Form.Group>
              <Form.Group className="mb-3 pb-4">
                <Form.Label>
                  <strong>Phương Thức Thanh Toán</strong>
                </Form.Label>
                <Form.Select
                  aria-label="Default select example"
                  value={paymentMethod}
                  onChange={(e) => setPaymentMethod(e.target.value)}
                >
                  <option></option>
                  <option>Thanh toán TRỰC TIẾP</option>
                  <option>Thanh toán qua PAYPAL</option>
                  <option>Thanh toán qua ví MOMO</option>
                  <option>Thanh toán qua ZALOPAY</option>
                </Form.Select>
              </Form.Group>
            </Form>
          </div>
          {paymentMethod === "Thanh toán qua PAYPAL" && (
            <>
              <Button
                onClick={handlePayWithPaypal}
                variant="info mt-2 mb-2"
                style={{ marginLeft: "10px" }}
              >
                Thanh toán PayPal
              </Button>
              <div ref={paypal} style={{ marginLeft: "10px" }}></div>
            </>
          )}

          {paymentSuccess ? ( 
            <Alert variant="success" className="mt-1 text-center">
              Thanh toán thành công! Mời bạn đặt tiệc.
            </Alert>
          ) : null}
          {showPaymentAlert && ( 
            <Alert variant="danger" className="mt-2 text-center">
              Vui lòng thanh toán bằng PayPal trước khi đặt tiệc.
            </Alert>
          )}
          {showPaymentError && (
            <Alert variant="danger" className="mt-2 text-center">
              Thanh toán thất bại! Mời bạn kiểm tra lại giỏ hàng trước khi thanh toán!!
            </Alert>
          )}
          <Button
            onClick={handlePlaceOrder}
            variant="info mt-2 mb-3"
            style={{ marginLeft: "10px" }}
          >
            Đặt Tiệc
          </Button>
        </div>
      )}
    </>
  );
};

export default Cart;
