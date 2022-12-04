import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="productprice"
export default class extends Controller {
  static targets = ["output"]
  static values = {
    id: Number
  }

  connect() {
  }

  decrement(){
    // const id = this.idValue;
    // const cart = JSON.parse(localStorage.getItem('cart'));
    // const indexObject = cart.findIndex(obj => obj.id == id);
    // console.log(indexObject);
    // cart[indexObject].amount -= 1;
    // localStorage.setItem("cart", JSON.stringify(cart));
    // const total = cart[indexObject].price * cart[indexObject].amount;
    // console.log(total);
    // this.outputTarget.innerText = `€ ${total}`;
  }
}
