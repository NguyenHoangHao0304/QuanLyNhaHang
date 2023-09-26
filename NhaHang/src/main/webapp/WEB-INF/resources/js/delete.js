function Delete(path) {
    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204) {
                alert("Bạn đã xóa thành công!!!");
                location.reload();
            } else {
                alert("something Wrong!!!");
            }
        })
    }
}

