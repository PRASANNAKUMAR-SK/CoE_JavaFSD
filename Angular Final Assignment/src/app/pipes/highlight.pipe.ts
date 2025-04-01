import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'highlight'
})
export class HighlightPipe implements PipeTransform {

    transform(target: string): string {
      let terms=[ 'chicken','recommended','amazing','great','biryani','hygiene','ambience',
        'authentic','fresh','best','flavourful','flavorful'	
        ]
    
        terms.forEach(term => {
          const regex = new RegExp(`\\b${term}\\b`, 'gi');
          target = target.replace(regex, match => `'${match.toUpperCase()}'`);
        });
        return target;
      }

    // transform(target: string): string {
    //   let terms = [
    //     'chicken', 'recommended', 'amazing', 'great', 'biryani', 'hygiene', 'ambience',
    //     'authentic', 'fresh', 'best', 'flavourful', 'flavorful'
    //   ];
    
    //   terms.forEach(term => {
    //     const regex = new RegExp(`\\b${term}\\b`, 'gi');
    //     target = target.replace(regex, match => `<span style="color: red; font-weight: bold;">${match.toUpperCase()}</span>`);
    //   });
    
    //   return target;
    // }
    
  }

