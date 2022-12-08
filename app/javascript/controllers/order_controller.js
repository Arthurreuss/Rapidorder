import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="order"
export default class extends Controller {
  static targets = ["output", "ordername"];
  static values = {
    restaurantid: Number,
    orderid: Number,
  };

  initialize() {
    this.count = 0;
  }

  connect() {}

  change() {
    this.count += 1;
    if (this.count == 1) {
      this.ordernameTarget.classList.remove("wait");
      this.ordernameTarget.classList.add("ready");
    }
    if (this.count == 2) {
      fetch(
        `/restaurants/${this.restaurantidValue}/update_status?order_id=${this.orderidValue}`
      );
      this.outputTarget.outerHTML = "";
    }
  }
}
