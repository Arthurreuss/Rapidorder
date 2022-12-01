import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkout"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
