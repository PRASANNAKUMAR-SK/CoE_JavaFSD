import { Component, Input } from '@angular/core';
import { RestaurantList } from '../../../model/restaurantlist';
import { Router } from '@angular/router';

@Component({
  selector: 'app-restaurant-item',
  templateUrl: './restaurant-item.component.html',
  styleUrl: './restaurant-item.component.css'
})
export class RestaurantItemComponent {
  @Input() restaurantlist: RestaurantList = {
    id: '',
    name: '',
    cuisine: '',
    address: '',
    dining_rating:'',
    delivery_rating: '',
    image: ''
  }

  constructor(private router: Router) {}
  onrestaurantClick(id:string) {
    this.router.navigate(['/restaurant-details', id], { state: { title: this.restaurantlist.name } });
  }

  restaurantlistarray: any[] = []; // Original list from API
  filteredRestaurants: any[] = []; // Filtered list
  searchQuery: string = ''; // Holds user input for search



  

}
