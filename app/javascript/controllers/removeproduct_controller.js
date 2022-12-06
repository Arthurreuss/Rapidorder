import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="remove-product"
export default class extends Controller {
  static outlets = ["totalprice"];
  static targets = ["remove"];
  static values = {
    id: Number,
  };

  connect() {}

  remove() {
    const id = this.idValue;
    const cart = JSON.parse(localStorage.getItem("cart"));
    const indexObject = cart.findIndex((obj) => obj.id == id);
    const amount = cart[indexObject].amount;
    const total = amount * cart[indexObject].price;
    this.removeTarget.classList.add("d-none");
    this.totalpriceOutlet.removeProduct(total);
    cart.splice(indexObject, 1);
    localStorage.setItem("cart", JSON.stringify(cart));
  }
}
