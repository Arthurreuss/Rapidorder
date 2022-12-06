import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = ["totalprice"];
  static targets = ["output", "price"];
  static values = {
    id: Number,
    price: Number,
  };

  connect() {}

  decrement() {
    if (this.count > 1) {
      this.count--;
      const id = this.idValue;
      const cart = JSON.parse(localStorage.getItem("cart"));
      const indexObject = cart.findIndex((obj) => obj.id == id);
      cart[indexObject].amount -= 1;
      localStorage.setItem("cart", JSON.stringify(cart));
      this.totalpriceOutlet.changeTotal(-cart[indexObject].price);
    }
  }

  increment() {
    this.count++;
    const id = this.idValue;
    const cart = JSON.parse(localStorage.getItem("cart"));
    const indexObject = cart.findIndex((obj) => obj.id == id);
    cart[indexObject].amount += 1;
    localStorage.setItem("cart", JSON.stringify(cart));
    this.totalpriceOutlet.changeTotal(cart[indexObject].price);
  }

  get count() {
    return this.data.get("count");
  }

  set count(value) {
    this.data.set("count", value);
    this.outputTarget.textContent = this.count;
    const price = this.priceValue;
    const total = price * this.count;
    this.priceTarget.textContent = `${this.#formatNumber(total)}`;
  }

  #formatNumber(number) {
    return Intl.NumberFormat("nl-NL", {
      style: "currency",
      currency: "EUR",
    }).format(number);
  }
}
