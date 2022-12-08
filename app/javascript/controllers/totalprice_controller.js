import { Controller } from "@hotwired/stimulus";

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
    const tip = JSON.parse(localStorage.getItem("tip"));
    if (tip) {
      this.tipTotal = tip;
      // this.grandTotal = this.total + this.tipTotal;
    }
    this.tipTarget.textContent = `${this.#formatNumber(this.tipTotal)}`;
    this.grandtotalTarget.textContent = ` ${this.#formatNumber(
      this.total + this.tipTotal
    )}`;
    localStorage.setItem("total", this.total);
  }

  addTip({ params: { tip } }) {
    this.tip = tip;
    this.tipTotal = this.tip * this.total;
    this.grandTotal = this.tipTotal + this.total;
    this.grandtotalTarget.textContent = `${this.#formatNumber(
      this.grandTotal
    )}`;
    this.tipTarget.textContent = `${this.#formatNumber(this.tipTotal)}`;
    localStorage.setItem("total", this.grandTotal);
    localStorage.setItem("tip", this.tipTotal);
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
    localStorage.setItem("total", this.grandTotal);
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
    localStorage.setItem("total", this.grandTotal);
  }

  #formatNumber(number) {
    return Intl.NumberFormat("es-ES", {
      style: "currency",
      currency: "EUR",
    }).format(number);
  }
}
