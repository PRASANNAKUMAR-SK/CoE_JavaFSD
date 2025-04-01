import { Component } from '@angular/core';
import { Reviews } from '../../model/review';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-reviews',
  templateUrl: './reviews.component.html',
  styleUrl: './reviews.component.css'
})
export class ReviewsComponent {

  reviewarray:Reviews[]=[]
  
    constructor(private as:ApiService) { }
    
    ngOnInit(): void {
      
      this.as.getReviews().subscribe({
           next:(result:Reviews[])=>{this.reviewarray=result},
           error:(err:any)=>{console.log(err)}
      })
   }

}
