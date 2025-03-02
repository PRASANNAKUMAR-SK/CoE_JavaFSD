
import React from 'react';
import { useCart } from '../context/CartContext';

const CartPage = () => {
  const { state, dispatch } = useCart();

  const handleRemoveFromCart = (product) => {
    dispatch({ type: 'REMOVE_FROM_CART', payload: product });
  };

  return (
    <div className="p-6">
      <h2 className="text-2xl mb-4">Your Cart</h2>
      {state.cart.length === 0 ? (
        <p>Your cart is empty</p>
      ) : (
        <div>
          <ul>
            {state.cart.map((product) => (
              <li key={product.id} className="flex justify-between mb-4">
                <span>{product.name}</span>
                <span>Rs{product.price}</span>
                <button
                  onClick={() => handleRemoveFromCart(product)}
                  className="bg-red-500 text-white px-2 py-1 rounded transition duration-300 ease-in-out hover:bg-red-700"
                  >
                  Remove
                </button>
              </li>
            ))}
          </ul>
          <div className="mt-4">
            <h3>Total: Rs{state.totalPrice}</h3>
          </div>
        </div>
      )}
    </div>
  );
};

export default CartPage;
