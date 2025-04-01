import { CanActivateFn } from '@angular/router';

export const reviewsGuard: CanActivateFn = (route, state) => {
  const username = localStorage.getItem('username');
  return username?true:false;


};

