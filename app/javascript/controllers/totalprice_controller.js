import { Controller } from "@hotwired/stimulus";
import { end } from "@popperjs/core";

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ["output", "tip", "grandtotal"];

  constructor(args) {
    super(args);
    this.total = 0;
    this.tip = 0;
    this.tipTotal = 0;
    this.grandtotal = 0;
  }

  connect() {
    const cart = JSON.parse(localStorage.getItem("cart"));
    cart.forEach((element) => {
      const price = element.amount * element.price;
      this.total += price;
    });
    this.outputTarget.textContent = `${this.#formatNumber(this.total)}`;
    this.tipTarget.textContent = `${this.#formatNumber(this.tip)}`;
    this.grandtotalTarget.textContent = ` ${this.#formatNumber(this.total)}`;
  }

  addTip({ params: { tip } }) {
    this.tip = tip;
    this.tipTotal = this.tip * this.total;
    this.grandTotal = this.tipTotal + this.total;
    this.grandtotalTarget.textContent = `${this.#formatNumber(
      this.grandTotal
    )}`;
    this.tipTarget.textContent = `${this.#formatNumber(this.tipTotal)}`;
  }

  changeTotal(price) {
    this.total += price;
    this.tipTotal = this.total * this.tip;
    this.grandTotal = this.total + this.tipTotal;
    this.outputTarget.textContent = `${this.#formatNumber(this.total)}`;
    this.tipTarget.textContent = `${this.#formatNumber(this.tipTotal)}`;
    this.grandtotalTarget.textContent = `${this.#formatNumber(
      this.grandTotal
    )}`;
  }

  removeProduct(price) {
    this.total -= price;
    this.tipTotal = this.total * this.tip;
    this.grandTotal = this.total + this.tipTotal;
    this.outputTarget.textContent = `${this.#formatNumber(this.total)}`;
    this.tipTarget.textContent = `${this.#formatNumber(this.tipTotal)}`;
    this.grandtotalTarget.textContent = `${this.#formatNumber(
      this.grandTotal
    )}`;
  }

  #formatNumber(number) {
    return Intl.NumberFormat("nl-NL", {
      style: "currency",
      currency: "EUR",
    }).format(number);
  }
}
