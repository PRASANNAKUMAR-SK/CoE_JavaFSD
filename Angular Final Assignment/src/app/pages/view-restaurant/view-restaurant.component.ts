import { Component, OnInit } from '@angular/core';
import { RestaurantList } from '../../model/restaurantlist';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-view-restaurant',
  templateUrl: './view-restaurant.component.html',
  styleUrls: ['./view-restaurant.component.css']
})
export class ViewRestaurantComponent implements OnInit {

  restaurantlistarray: RestaurantList[] = []; 
  filteredRestaurants: RestaurantList[] = []; 
  searchQuery: string = ''; 

  constructor(private as: ApiService) { }

  ngOnInit(): void {
    this.as.getRestaurants().subscribe({
      next: (result: RestaurantList[]) => {
        this.restaurantlistarray = result;
        this.filteredRestaurants = [...result]; 
      },
      error: (err: any) => console.log(err)
    });
  }

  // Search 
  filterRestaurants(): void {
    const query = this.searchQuery.toLowerCase().trim();

    if (!query) {

      this.filteredRestaurants = [...this.restaurantlistarray];
    } else {
      this.filteredRestaurants = this.restaurantlistarray.filter(restaurant =>
        restaurant.name.toLowerCase().includes(query) ||
        restaurant.address.toLowerCase().includes(query)
      );
    }
  }
}

