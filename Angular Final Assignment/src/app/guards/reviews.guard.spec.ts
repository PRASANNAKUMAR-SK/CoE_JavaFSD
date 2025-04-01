import { TestBed } from '@angular/core/testing';
import { CanActivateFn } from '@angular/router';

import { reviewsGuard } from './reviews.guard';

describe('reviewsGuard', () => {
  const executeGuard: CanActivateFn = (...guardParameters) => 
      TestBed.runInInjectionContext(() => reviewsGuard(...guardParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeGuard).toBeTruthy();
  });
});
