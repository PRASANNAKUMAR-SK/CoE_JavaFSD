import { Component } from '@angular/core';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-review-form',
  templateUrl: './review-form.component.html',
  styleUrl: './review-form.component.css'
})
export class ReviewFormComponent {
   name: string = '';
    restaurantName: string = '';
    review: string = '';
    rating: string = '';
    errors:string[]=[]
   
    
   
    constructor(private api: ApiService) {}
    
    submitForm() {
      this.errors=[]
      if(!this.name || this.name.length<3){
        this.errors.push("Name should be atleast three characters long")
      }
      
  
      if(this.errors.length==0){
        this.api.addReviews({
          name: this.name,
          restaurantName: this.restaurantName,
          review: this.review,
          rating: this.rating
        }).subscribe({
            next: (response) => {
              console.log("Enquiry Form Response:", response);
              this.name = '';
              this.restaurantName = '';
              this.review= '';
              this.rating = '';
              alert("Enquiry Submitted Successfully")	
            },
            error: (error) => {
              alert("Something went wrong. Please try again")
           }});
      }
   
    }
  }
  

