import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ContactComponent } from './pages/contact/contact.component';
import { AboutComponent } from './pages/about/about.component';
import { HomepageComponent } from './pages/homepage/homepage.component';
import { ViewRestaurantComponent } from './pages/view-restaurant/view-restaurant.component';
import { MenuBarComponent } from './common/menu-bar/menu-bar.component';
import { LoginComponent } from './common/login/login.component';
import { HeroSectionComponent } from './hero-section/hero-section.component';
import { FormsModule } from '@angular/forms';
import { RestaurantItemComponent } from './pages/view-restaurant/restaurant-item/restaurant-item.component';
// import { EnquiryFormComponent } from './pages/home/enquiry-form/enquiry-form.component';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { ReviewsComponent } from './pages/reviews/reviews.component';
import { ReviewItemComponent } from './pages/reviews/review-item/review-item.component';
import { ReviewFormComponent } from './pages/review-form/review-form.component';
import { HighlightPipe } from './pipes/highlight.pipe';
import { FilterservicePipe } from './pipes/filterservice.pipe';
import { RestaurantDetailsComponent } from './pages/view-restaurant/restaurant-details/restaurant-details.component';
import { RestaurantFormComponent } from './pages/restaurant-form/restaurant-form.component';
import { AddRestaurantComponent } from './pages/add-restaurant/add-restaurant.component';
import { RatingPipe } from './pipes/rating-pipe.pipe';

@NgModule({
  declarations: [
    AppComponent,
    MenuBarComponent,
    LoginComponent,
    ContactComponent,
    AboutComponent,
    HomepageComponent,
    ViewRestaurantComponent,
    HeroSectionComponent,
    RestaurantItemComponent,
    ReviewsComponent,
    ReviewItemComponent,
    ReviewFormComponent,
    HighlightPipe,
    FilterservicePipe,
    RestaurantDetailsComponent,
    RestaurantFormComponent,
    AddRestaurantComponent,
    RatingPipe,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    RouterModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
