import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { id: Number }

  connect() {
    console.log("hellor")
  }

  submit(event) {
    event.preventDefault()
    console.log(this.element)
    fetch(`products/${this.idValue}/reviews`, {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({"rating": parseInt(this.element.querySelector('span.gl-star-rating--stars').dataset.rating), "product_id": this.idValue })
    })
    //this.element.submit();
  }
}
