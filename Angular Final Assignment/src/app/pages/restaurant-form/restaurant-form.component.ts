import { Component } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-restaurant-form',
  templateUrl: './restaurant-form.component.html',
  styleUrl: './restaurant-form.component.css'
})
export class RestaurantFormComponent {
    id: string ='';
    name: string = '';
    cuisine: string = '';
    address: string = '';
    dining_rating: string = '';
    delivery_rating: string = '';
    image: string ='';
    errors:string[]=[]

 constructor(private api: ApiService) {}

 submitForm() {
  this.errors=[]
  

  if(this.errors.length==0){
    this.api.addRestaurant({
      id: this.id,
      name: this.name,
      cuisine: this.cuisine,
      address: this.address,
      dining_rating: this.dining_rating
    }).subscribe({
        next: (response) => {
          console.log("Enquiry Form Response:", response);
          this.id='',
          this.name = '';
          this.cuisine = '';
          this.address= '';
          this.dining_rating = '';
          this.delivery_rating = '';
          this.image='';
          alert("Enquiry Submitted Successfully")	
        },
        error: (error) => {
          alert("Something went wrong. Please try again")
       }});
  }

}
    

}
