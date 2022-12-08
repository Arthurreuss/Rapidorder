import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="priceconfirmation"
export default class extends Controller {
  static targets = ["output", "tip", "grandtotal"];

  connect() {
    const tip = JSON.parse(localStorage.getItem("tip"));
    const grandTotal = JSON.parse(localStorage.getItem("total"));
    this.outputTarget.textContent = `${this.#formatNumber(grandTotal - tip)}`;
    if (tip) {
      this.tipTarget.textContent = `${this.#formatNumber(tip)}`;
    } else {
      this.tipTarget.textContent = `${this.#formatNumber(0)}`;
    }
    this.grandtotalTarget.textContent = `${this.#formatNumber(grandTotal)}`;
  }

  #formatNumber(number) {
    return Intl.NumberFormat("es-ES", {
      style: "currency",
      currency: "EUR",
    }).format(number);
  }
}
