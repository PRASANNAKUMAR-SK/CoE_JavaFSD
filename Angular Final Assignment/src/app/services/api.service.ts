import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http:HttpClient) { }

  getRestaurants():Observable<any>{
    return this.http.get('http://localhost:4050/restaurant-list');
  }

  getDetails(id:string):Observable<any>{
    return this.http.get(`http://localhost:4050/restaurant-details?id=${id}`);
  }

  getReviews():Observable<any>{
    return this.http.get('http://localhost:4050/reviews');
  }

  addReviews(data:any):Observable<any>{
    return this.http.post('http://localhost:4050/reviews',data);
  }

  addRestaurant(data:any):Observable<any>{
    return this.http.post('http://localhost:4050/restaurant-list',data);
  }
}


