import { Application, Controller } from "@hotwired/stimulus"

// Connects to data-controller="shoppingcart"
export default class extends Controller {
  // static values = {
  //   amount: Number,
  //   id: Number
  // }
  static targets = ["card"];

  connect() {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch('/cart', {
      method: 'POST',
      headers: {
      'Accept': 'text/plain',
      'X-CSRF-Token': csrfToken,
      'Content-Type': 'application/json',
    },
      body: localStorage.getItem('cart'),
    })
      .then(response => response.text())
      .then((data => {
        this.cardTarget.innerHTML = data;
      }))
  }
}
