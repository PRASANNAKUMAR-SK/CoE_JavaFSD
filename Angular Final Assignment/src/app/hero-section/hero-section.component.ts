import { Component } from '@angular/core';

@Component({
  selector: 'app-hero-section',
  templateUrl: './hero-section.component.html',
  styleUrl: './hero-section.component.css'
})
export class HeroSectionComponent {

  searchQuery: string = '';

  search() {
    if (this.searchQuery.trim()) {
      console.log('Searching for:', this.searchQuery);
      // Redirect to search page or filter results (modify this as needed)
    } else {
      alert('Please enter a search term.');
    }
  }
}
