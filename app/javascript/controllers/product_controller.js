import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cart"
export default class extends Controller {
  static values = {
    id: Number,
    price: Number,
    table: String,
  };

  connect() {}

  updatecart() {
    const id = this.idValue;
    const price = this.priceValue;
    const table = this.tableValue;
    const cart = JSON.parse(localStorage.getItem("cart"));
    const item = cart.find((el) => el.id === id);
    if (item) {
      item.amount += 1;
    } else {
      const item = { table: table, id: id, amount: 1, price: price };
      cart.push(item);
    }
    localStorage.setItem("cart", JSON.stringify(cart));
  }
}
