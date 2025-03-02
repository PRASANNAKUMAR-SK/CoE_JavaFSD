 
import React from 'react';
import { useCart } from '../context/CartContext';

const ProductCard = ({ product }) => {
  const { dispatch } = useCart();

  const handleAddToCart = () => {
    dispatch({ type: 'ADD_TO_CART', payload: product });
  };

  return (
    <div className="border p-4 m-2">
      <h3 className="font-semibold">{product.name}</h3>
      <p>{product.price}</p>
      <button
        //className="bg-green-500 text-white py-2 px-4 mt-2"
        onClick={handleAddToCart}
        className="bg-green-500 text-white p-2 mt-2 rounded transition duration-300 ease-in-out hover:bg-blue-700"

      >
        Add to Cart
      </button>
    </div>
  );
};

export default ProductCard;
