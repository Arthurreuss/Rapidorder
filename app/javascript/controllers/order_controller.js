import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="order"
export default class extends Controller {
  static targets = ["output"];
  static values = {
    id: Number,
  };

  connect() {
    console.log("hi");
  }

  change() {
    this.outputTarget.classList.remove("btn-danger");
    this.outputTarget.classList.add("btn-success");
    setTimeout(() => {
      `http://localhost:3000/restaurants/1/update_status?order_id=${this.idValue}`;
    }, 30000);
  }
}
