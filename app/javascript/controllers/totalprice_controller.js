import { Controller } from "@hotwired/stimulus";
import { end } from "@popperjs/core";

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ["output", "tip", "grandtotal"];
  static values = {
    tip5: { type: Number, default: 0.05 },
    tip10: { type: Number, default: 0.1 },
    tip15: { type: Number, default: 0.15 },
  };

  constructor(args) {
    super(args);
    this.total = 0;
    this.tip = 0;
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

  addTip5() {
    this.tip = this.tip5Value * this.total;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tip}`;
    this.tipTarget.textContent = `€ ${this.tip}`;
  }

  addTip10() {
    this.tip = this.tip10Value * this.total;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tip}`;
    this.tipTarget.textContent = `€ ${this.tip}`;
  }

  addTip15() {
    this.tip = this.tip15Value * this.total;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tip}`;
    this.tipTarget.textContent = `€ ${this.tip}`;
  }

  changeTotal(price) {
    this.total += price;
    this.outputTarget.textContent = `€ ${this.total}`;
    this.grandtotalTarget.textContent = `€ ${this.total + this.tip}`;
  }

  removeProduct(price) {
    this.total -= price;
    this.outputTarget.textContent = `€ ${this.total}`;
    if (this.total === 0) {
      this.tip = 0;
      this.tipTarget.textContent = "€ 0.00";
    } else {
      this.tipTarget.textContent = `€ ${this.tip}`;
    }
    this.grandtotalTarget.textContent = `€ ${this.total + this.tip}`;
  }
}
