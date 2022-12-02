import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove-product"
export default class extends Controller {
  connect() {
    console.log('hi');
  }

  remove(){
    this.removeTarget.classList.add('d-none');
  }
}
