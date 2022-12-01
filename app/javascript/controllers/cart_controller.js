import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  connect() {
    if(localStorage.getItem(cart) == nul) {
      let cart = [];
      localStorage.setItem('cart', JSON.stringify(cart));
    }
  }
}
