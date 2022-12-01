import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shoppingcart"
export default class extends Controller {
  static values = {
    amount: Number,
    id: Number
  }
  static targets = ["amount"];

  connect() {
    const products = JSON.parse(localStorage.getItem('cart'));
    fetch('/cart', {
      headers: {
      'Accept': 'text/plain',
    },
      body: products,
    })
      .then(response => response.json())
      .then((data => console.log(data)))
    // request to pagescontroller#cart
    // receive data and display in   html
  }

}
