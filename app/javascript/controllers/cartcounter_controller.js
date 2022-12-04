import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cartcounter"
export default class extends Controller {
  static targets = ["output"]

  connect() {
    const cart_amount = JSON.parse(localStorage.getItem('cart')).length;
    if (cart_amount != 0) this.outputTarget.innerHTML = cart_amount;
  }

  updatecounter(){
    const cart_amount = JSON.parse(localStorage.getItem('cart')).length;
    // this.cartcounterTarget.classList.remove('d-none');
    this.outputTarget.innerHTML = cart_amount;
  }
}
