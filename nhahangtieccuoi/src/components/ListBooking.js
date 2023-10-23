import React, { useState, useEffect } from "react";
import { authApi, endpoints } from "../configs/Apis";
import { Table, Button, Form } from "react-bootstrap";

const BookingList = () => {
  const [bookingList, setBookingList] = useState([]);
  const [editingIndex, setEditingIndex] = useState(-1);
  const [editBooking, setEditedBooking] = useState({});

  const loadBookingList = async () => {
    try {
      const response = await authApi().get(endpoints[`bookinglist`]);
      setBookingList(response.data);
    } catch (error) {
      console.error("Lỗi khi lấy thông tin tiệc", error);
    }
  };

  useEffect(() => {
    loadBookingList();
  }, []);

  const handleEditBooking = (index) => {
    setEditingIndex(index);
    setEditedBooking({ ...bookingList[index] });
  };

  const handleSaveChanges = async () => {
    try {
      await authApi().put(
        endpoints[`bookingUpdate`](editBooking.id),
        {
          bookingName: editBooking.bookingName,
          tableNumber: editBooking.tableNumber,
        //   startTime: editBooking.startTime,
          bookingDate: editBooking.bookingDate
        }
      );


      loadBookingList();
      setEditingIndex(-1);
      setEditedBooking({});
    } catch (error) {
      console.error("Lỗi khi cập nhật thông tin tiệc", error);
    }
  };

  return (
    <>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>#</th>
            <th>Ngày tổ chức</th>
            <th>Thời gian</th>
            <th>Số lượng bàn</th>
            <th>Loại tiệc</th>
            <th>Sảnh cưới</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
          </tr>
        </thead>
        <tbody>
          {bookingList.map((bk, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{bk.bookingDate}</td>
              <td>{bk.startTime}</td>
              <td>{bk.tableNumber}</td>
              <td>{bk.bookingName}</td>
              <td>{bk.hallId.hallName}</td>
              <td>
                {new Intl.NumberFormat("vi-VN", {
                  style: "currency",
                  currency: "VND",
                }).format(bk.total)}
              </td>
              <td>{bk.status}</td>
              <td>
                {editingIndex === index ? (
                  <div>
                    <Form.Control
                      type="date"
                      value={editBooking.bookingDate}
                      onChange={(e) =>
                        setEditedBooking({
                          ...editBooking,
                          bookingDate: e.target.value,
                        })
                      }
                    />
                    {/* <Form.Control
                      type="text"
                      value={editBooking.startTime}
                      onChange={(e) =>
                        setEditedBooking({
                          ...editBooking,
                          startTime: e.target.value,
                        })
                      }
                    /> */}
                    <Form.Control
                      type="text"
                      value={editBooking.bookingName}
                      onChange={(e) =>
                        setEditedBooking({
                          ...editBooking,
                          bookingName: e.target.value,
                        })
                      }
                    />
                    <Form.Control
                      type="number"
                      value={editBooking.tableNumber}
                      onChange={(e) =>
                        setEditedBooking({
                          ...editBooking,
                          tableNumber: e.target.value,
                        })
                      }
                    />
                  </div>
                ) : (
                  <Button onClick={() => handleEditBooking(index)}>
                    Chỉnh sửa
                  </Button>
                )}
                {editingIndex === index && (
                  <Button onClick={handleSaveChanges}>Lưu thay đổi</Button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
};

export default BookingList;
