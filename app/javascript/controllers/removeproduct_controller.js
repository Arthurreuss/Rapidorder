import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove-product"
export default class extends Controller {
  static targets = ["remove"]

  connect() {
    console.log('hi');
  }

  remove(event){
    console.log(event);
    this.removeTarget.classList.add('d-none');
  }
}
