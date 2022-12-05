import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {

  static values = {
    id: Number,
    price: Number
  }

  connect() {
  }

  updatecart(){
    const id = this.idValue;
    const price = this.priceValue;
    const cart = JSON.parse(localStorage.getItem('cart'));
    const item = cart.find(el => el.id === id);
    if (item) {
      item.amount += 1;
    } else {
      const item = {id: id, amount: 1, price: price};
      cart.push(item);
    }
      localStorage.setItem("cart", JSON.stringify(cart));
  }


}
