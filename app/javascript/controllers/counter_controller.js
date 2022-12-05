import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['output', 'price']
  static values = {
    id: Number,
    price: Number
  }

  connect() {
  }

  decrement() {
     if (this.count > 1) {
      this.count--;
      const id = this.idValue;
      const cart = JSON.parse(localStorage.getItem('cart'));
      const indexObject = cart.findIndex(obj => obj.id == id);
      cart[indexObject].amount -= 1;
      localStorage.setItem("cart", JSON.stringify(cart));
    }
  }

  increment() {
    this.count++;
    const id = this.idValue;
    const cart = JSON.parse(localStorage.getItem('cart'));
    const indexObject = cart.findIndex(obj => obj.id == id);
    cart[indexObject].amount += 1;
    localStorage.setItem("cart", JSON.stringify(cart));
    // outlet to 
  }

  get count() {
    return this.data.get("count");
  }

  set count(value) {
    this.data.set("count", value);
    this.outputTarget.textContent = this.count;
    const price = this.priceValue;
    console.log(price);
    const total = price * this.count;
    console.log(total);
    this.priceTarget.textContent = `€ ${total}`;
  }
}


// const id = this.idValue;
// const cart = JSON.parse(localStorage.getItem('cart'));
// const indexObject = cart.findIndex(obj => obj.id == id);
// cart[indexObject].amount -= 1;
// localStorage.setItem("cart", JSON.stringify(cart));

// const totalCount = document.getElementById("total-count");
// let count = 1;
// totalCount.innerHTML = count;

// const handleIncrement = () => {
//   count++;
//   totalCount.innerHTML = count;
// };
// const handleDecrement = () => {
//   count--;
//   totalCount.innerHTML = count;
// };
// const incrementCount = document.getElementById("increment-count");
// const decrementCount = document.getElementById("decrement-count");
// incrementCount.addEventListener("click", handleIncrement);
// decrementCount.addEventListener("click", handleDecrement);
