import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiService } from '../../../services/api.service';

@Component({
  selector: 'app-restaurant-details',
  templateUrl: './restaurant-details.component.html',
  styleUrl: './restaurant-details.component.css'
})
export class RestaurantDetailsComponent {

  id:any = '';
  title:string = '';
  desctitle:string = '';
  descimage:string ='';
  descaddress:string[] = [];
  desccuisine:string ='';
  descdescription:string ='';
  descdiningrating:string ='';
  descdeliveryrating:string ='';


  constructor(private route: ActivatedRoute,private router:Router
    ,private api:ApiService
  ) {
    this.id = this.route.snapshot.paramMap.get('id');
    const navigation = this.router.getCurrentNavigation();
    console.log(navigation)
    if (navigation?.extras.state) {
      this.title = navigation.extras.state['title'];
      console.log('Title:', this.title);
    }
  

  
    
  }

  ngOnInit() {

   this.api.getDetails(this.id).subscribe({
     next	: (result:any) => {
      console.log(result)
        this.desctitle = result[0].name;
        this.desccuisine = result[0].cuisine;
        this.descaddress = result[0].address;
        this.descimage = result[0].image;
        this.descdescription=result[0].description;
        this.descdiningrating = result[0].dining_rating;
        this.descdeliveryrating = result[0].delivery_rating;

     },
     error: (error:any) => console.log(error)
   });
     

  }

}
