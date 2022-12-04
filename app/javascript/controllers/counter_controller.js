import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['output']
  static values = {
    id: Number
  }

  connect() {
  }

  decrement() {
     if (this.count > 1) {
      this.count--;
    }
      const id = this.idValue;
      console.log(price);
      const cart = JSON.parse(localStorage.getItem('cart'));
      const indexObject = cart.findIndex(obj => obj.id == id);
      cart[indexObject].amount -= 1;
      localStorage.setItem("cart", JSON.stringify(cart));
  }

  increment() {
    this.count++;
  }

  get count() {
    return this.data.get("count");
  }

  set count(value) {
    this.data.set("count", value);
    this.outputTarget.textContent = this.count;
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
