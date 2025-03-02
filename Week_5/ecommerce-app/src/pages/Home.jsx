 
import React from 'react';
import ProductCard from '../components/ProductCard';

const products = [
  { id: 1221, name: 'Shoes', price: 100 },
  { id: 1331, name: 'Shirt', price: 200 },
  { id: 1441, name: 'Pants', price: 300 },
  {
    id: 1551, name: 'books', price: 500
  },
  { id: 1661, name: 'toys', price: 300 },
  {
    id: 1771, name: 'snacks', price: 500
  },
];

const Home = () => {
  return (
    <div className="p-4">
      <h2 className="font-semibold mb-4">Products</h2>
      <div className="grid grid-cols-3 gap-4">
        {products.map(product => (
          <ProductCard key={product.id} product={product} />
          
        ))}
      </div>
    </div>
  );
};

export default Home;
