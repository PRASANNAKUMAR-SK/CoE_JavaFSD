import { Pipe, PipeTransform } from '@angular/core';
import { Reviews } from '../model/review';

@Pipe({
  name: 'filterservice'
})
export class FilterservicePipe implements PipeTransform {

  transform(enquirylist: Reviews[], serviceType:string): Reviews[] {
    if(serviceType === 'All') 
      return enquirylist;
    
    return enquirylist.filter(enquiry => enquiry.review === serviceType);
  }

}
