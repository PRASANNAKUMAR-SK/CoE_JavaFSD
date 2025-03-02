// src/context/CartContext.jsx

import React, { createContext, useContext, useReducer } from 'react';

// Initial state of the cart
const initialState = {
  cart: [],  // Array to hold cart items
  totalPrice: 0,  // Total price of items in the cart
};

// Define action types
const ADD_TO_CART = 'ADD_TO_CART';
const REMOVE_FROM_CART = 'REMOVE_FROM_CART';

// Create a reducer function to handle actions
function cartReducer(state, action) {
  switch (action.type) {
    case ADD_TO_CART:
      // Add product to cart and update total price
      const updatedCart = [...state.cart, action.payload];
      const updatedTotalPrice = updatedCart.reduce(
        (total, product) => total + product.price,
        0
      );
      return {
        ...state,
        cart: updatedCart,
        totalPrice: updatedTotalPrice,
      };

    case REMOVE_FROM_CART:
      // Remove product from cart and update total price
      const filteredCart = state.cart.filter(
        (product) => product.id !== action.payload.id
      );
      const newTotalPrice = filteredCart.reduce(
        (total, product) => total + product.price,
        0
      );
      return {
        ...state,
        cart: filteredCart,
        totalPrice: newTotalPrice,
      };

    default:
      return state;
  }
}

// Create CartContext
const CartContext = createContext();

// Create a CartProvider to wrap the app and provide global state
export function CartProvider({ children }) {
  const [state, dispatch] = useReducer(cartReducer, initialState);

  return (
    <CartContext.Provider value={{ state, dispatch }}>
      {children}
    </CartContext.Provider>
  );
}

// Custom hook to access cart context in any component
export const useCart = () => useContext(CartContext);
