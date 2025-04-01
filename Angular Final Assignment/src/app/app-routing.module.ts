import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './pages/about/about.component';
import { ContactComponent } from './pages/contact/contact.component';
import { HomepageComponent } from './pages/homepage/homepage.component';
import { ViewRestaurantComponent } from './pages/view-restaurant/view-restaurant.component';
import { ReviewsComponent } from './pages/reviews/reviews.component';
import { LoginComponent } from './common/login/login.component';
import { reviewsGuard } from './guards/reviews.guard';
import { RestaurantDetailsComponent } from './pages/view-restaurant/restaurant-details/restaurant-details.component';
import { AddRestaurantComponent } from './pages/add-restaurant/add-restaurant.component';

const routes: Routes = [
  {path:'home',component:HomepageComponent},
  {path:'',component:HomepageComponent},

  {path:'about',component:AboutComponent},
  {path:'contact',component:ContactComponent},
  {path:'viewrestaurants',component:ViewRestaurantComponent},
  {path:'reviews',component:ReviewsComponent,canActivate:[reviewsGuard]},
  {path:'addrestaurant',component:AddRestaurantComponent,canActivate:[reviewsGuard]},

  {path:'login',component:LoginComponent},
  {path:'restaurant-details/:id',component:RestaurantDetailsComponent}












];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
