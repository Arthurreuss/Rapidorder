import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  connect() {
    console.log("test")
    if(localStorage.getItem('cart') === null) {
      let cart = [];
      localStorage.setItem('cart', JSON.stringify(cart));
    }
  }
}
