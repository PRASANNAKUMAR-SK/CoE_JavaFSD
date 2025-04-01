 
import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="bg-blue-500 p-4 text-white">
      <Link to="/" className="mr-4">Home</Link>
      <Link to="/cart">Cart</Link>
    </nav>
  );
};

export default Navbar;
