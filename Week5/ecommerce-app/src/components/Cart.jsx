 

import React from 'react';
import { useCart } from '../context/CartContext';

const Cart = () => {
  const { state, dispatch } = useCart();
  
  const handleRemove = (id) => {
    dispatch({ type: 'REMOVE_FROM_CART', payload: id });
  };

  const totalPrice = state.cart.reduce((acc, item) => acc + item.price, 0);

  return (
    <div className="p-4">
      <h2 className="font-semibold">Shopping Cart</h2>
      {state.cart.length === 0 ? (
        <p>Your cart is empty</p>
      ) : (
        <ul>
          {state.cart.map(item => (
            <li key={item.id} className="flex justify-between items-center py-2">
              <span>{item.name} - ${item.price}</span>
              <button
                className="bg-red-500 text-white px-2 py-1"
                onClick={() => handleRemove(item.id)}
              >
                Remove
              </button>
            </li>
          ))}
        </ul>
      )}
      <h3>Total Price: ${totalPrice}</h3>
    </div>
  );
};

export default Cart;
