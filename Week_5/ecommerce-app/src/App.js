// src/App.js
import React from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import { useCart } from './context/CartContext';
import Home from './pages/Home';
import CartPage from './pages/CartPage';

const App = () => {
  return (
    <div>
      <nav className="bg-blue-500 p-4 text-white">
        <Link to="/" className="mr-4">Home</Link>
        <Link to="/cart">Cart</Link>
      </nav>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/cart" element={<CartPage />} />
      </Routes>
    </div>
  );
};

export default App;
