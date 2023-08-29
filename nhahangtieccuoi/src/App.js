import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./layout/Header";
import Footer from "./layout/Footer";
import Home from "./components/Home";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container } from "react-bootstrap";
import Halls from "./components/Halls";
import Foods from "./components/Foods";
const App = () => {
  return (
    <BrowserRouter>
      <Header />
      <Container>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/halls" element={<Halls />} />
          <Route path="/foods" element={<Foods />} />
        </Routes>
      </Container>
      <Footer />
    </BrowserRouter>
  )
}
export default App;
