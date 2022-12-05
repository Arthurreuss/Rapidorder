import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove-product"
export default class extends Controller {
  static targets = ["remove"]
  static values = {
    id: Number
  }

  connect() {
  }

  remove(){
    const id = this.idValue;
    const cart = JSON.parse(localStorage.getItem('cart'));
    const indexObject = cart.findIndex(obj => obj.id == id);
    cart.splice(indexObject, 1);
    localStorage.setItem("cart", JSON.stringify(cart));
    this.removeTarget.classList.add('d-none');
  }
}
