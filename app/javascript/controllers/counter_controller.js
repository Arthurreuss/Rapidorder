import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['output']

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  decrement() {
     if (this.count > 1) {
      this.count--;
    }
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
