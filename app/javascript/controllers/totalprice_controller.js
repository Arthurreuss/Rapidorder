import { Controller } from "@hotwired/stimulus";
import { end } from "@popperjs/core";

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ["output", "tip", "grandtotal"];
  // static values = {
  //   tip5: { type: Number, default: 0.05 },
  //   tip10: { type: Number, default: 0.1 },
  //   tip15: { type: Number, default: 0.15 },
  // };

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
    this.outputTarget.textContent = `€ ${this.total}`;
    this.tipTarget.textContent = "€ 0,00";
    this.grandtotalTarget.textContent = `€ ${this.total}`;
  }

  addTip({ params: { tip } }) {
    this.tip = tip;
    this.tipTotal = this.tip * this.total;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tipTotal}`;
    this.tipTarget.textContent = `€ ${this.tipTotal}`;
  }

  changeTotal(price) {
    this.total += price;
    this.tipTotal = this.total * this.tip;
    this.outputTarget.textContent = `€ ${this.total}`;
    this.tipTarget.textContent = `€ ${this.tipTotal}`;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tipTotal}`;
  }

  removeProduct(price) {
    this.total -= price;
    this.tipTotal = this.total * this.tip;
    this.outputTarget.textContent = `€ ${this.total}`;
    this.tipTarget.textContent = `€ ${this.tipTotal}`;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tipTotal}`;
  }
}
