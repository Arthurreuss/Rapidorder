import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="overage"
export default class extends Controller {
  connect() {
    const cart = JSON.parse(localStorage.getItem("cart"));
    const arr = cart.map((element) => {
      const product = Product.find(element.id);
      if (
        product.category === "Wine" ||
        product.category === "Beer" ||
        product.category === "Cocktail"
      ) {
        return product.category;
      }
    });
    console.log(arr);
    if (arr) this.outputTarget.classList.remove("d-none");
  }
}
