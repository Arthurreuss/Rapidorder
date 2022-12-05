import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ['output', 'tip', 'grandtotal']
  static values = {
    tip5: { type: Number, default: 1.05 },
    tip10: { type: Number, default: 1.10 },
    tip15: { type: Number, default: 1.15 }
  }

  constructor(args){
    super(args);
    this.total = 0;
  }

  connect() {
    const cart = JSON.parse(localStorage.getItem('cart'));
    cart.forEach(element => {
        const price = element.amount * element.price;
        this.total += price;
    });
    this.outputTarget.textContent = `€ ${this.total}`;
  }

  addTip5(){
    const tip = this.tip5Value;
    const grandTotal = this.total * tip;
    this.grandtotalTarget.textContent = `€ ${grandTotal}`;
  }
}
