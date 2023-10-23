- Code Server: Apache NetBeans IDE 16 (JDK 19)
- Code Clien: Visual Studio Code
- Hướng dẫn chạy website: 
+B1: Mở Apache NetBeans -> Chọn Run -> nhập usernam, password Tomcat ->Đợi chạy xong và muốn đăng nhập 1 trong 2 role để dùng (Nhân viên(an123,123456), Admin(admin,123456@)).
+B2: Mở Vs Code -> chọn Terminal -> new Terminal -> Chỗ dấu "+" chọn CommandPrompt -> gõ vào terminal mới tạo "yarn start" để chạy website.
*Lưu ý: - Nếu chưa có các thư viện sẵn thì vui lòng cài như: "npm install react react-router-dom@6 react-bootstrap bootstrap axios react-cookie react-moment".
	- Nếu đã có sẵn các thư viện rồi thì làm như bước 2 để khởi chạy.
	- Nếu như bị xóa file node_modules thì vui lòng làm như bước 2 nhưng gõ lệnh "yarn install" để cài đặt lại các thư viện và làm như bước 2 để khởi chạy.