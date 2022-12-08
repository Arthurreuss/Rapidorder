import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="order"
export default class extends Controller {
  static targets = ["output"];
  static values = {
    orderid: Number,
    restaurantid: Number,
  };

  connect() {}

  change() {
    this.outputTarget.classList.remove("btn-danger");
    this.outputTarget.classList.add("btn-success");
    setTimeout(() => {
      this.outputTarget.classList.add("d-none");
    }, 10000);
    setTimeout(() => {
      window.location.href = `//localhost:3000/restaurants/${this.restaurantidValue}/update_status?order_id=${this.orderidValue}`;
    }, 11000);
  }
}
