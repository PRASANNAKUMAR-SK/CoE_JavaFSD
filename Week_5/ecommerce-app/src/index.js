import React from 'react';
import { createRoot } from 'react-dom/client';
import './index.css';  // Importing Tailwind styles
import App from './App';
import { BrowserRouter } from 'react-router-dom';
import { CartProvider } from './context/CartContext'; // Import the CartProvider

// Get the root element
const root = createRoot(document.getElementById('root')); // We only need to call createRoot once

// Render the app
root.render(
  <BrowserRouter>
    <CartProvider>  {/* Wrap your app with CartProvider */}
      <App />
    </CartProvider>
  </BrowserRouter>
);
