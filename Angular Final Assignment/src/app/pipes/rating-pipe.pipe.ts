import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'rating'
})
export class RatingPipe implements PipeTransform {
  transform(value: number | string): string {
    const numericValue = Number(value); // Convert string to number
    if (isNaN(numericValue) || numericValue < 1) return 'No Rating';

    const maxStars = 5; // Limit max stars
    const roundedValue = Math.min(Math.round(numericValue), maxStars);

    return '⭐'.repeat(roundedValue);
  }
}
