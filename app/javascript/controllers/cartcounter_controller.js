import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cartcounter"
export default class extends Controller {
  static targets = ["output"];

  connect() {
    const cart = JSON.parse(localStorage.getItem("cart"));
    let cart_amount = 0;
    cart.forEach((element) => {
      cart_amount += element.amount;
    });
    if (cart_amount != 0) this.outputTarget.textContent = `(${cart_amount})`;
  }

  updatecounter() {
    const cart = JSON.parse(localStorage.getItem("cart"));
    let cart_amount = 0;
    cart.forEach((element) => {
      cart_amount += element.amount;
    });
    this.outputTarget.textContent = `(${cart_amount})`;
  }
}
