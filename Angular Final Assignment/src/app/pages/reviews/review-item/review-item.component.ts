import { Component, Input } from '@angular/core';
import { Reviews } from '../../../model/review';

@Component({
  selector: 'app-review-item',
  templateUrl: './review-item.component.html',
  styleUrl: './review-item.component.css'
})
export class ReviewItemComponent {

  @Input() Reviews: Reviews = {
      
      name: '',
      restaurantName: '',
      review: '',
      rating: '',
    }
}
