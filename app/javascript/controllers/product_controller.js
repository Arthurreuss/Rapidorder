import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  static values = {
    id: String
  }

  connect() {
  }

  updatecart(){
    const id = this.idValue;
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const item = {id: id, amount: '1'};
    cart.push(item);
    localStorage.setItem("cart", JSON.stringify(cart));
  }
}
