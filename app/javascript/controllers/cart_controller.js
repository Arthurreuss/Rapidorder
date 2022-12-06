import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cart"
export default class extends Controller {
  static values = {
    table: String,
  };

  connect() {
    if (localStorage.getItem("cart") === null) {
      let cart = [];
      console.log(this.tableValue);
      const table = { table: this.tableValue };
      console.log(table);
      cart.push(table);
      localStorage.setItem("cart", JSON.stringify(cart));
    }
  }
}
