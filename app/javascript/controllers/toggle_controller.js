import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "element"]

  connect() {
    console.log("connected")
    console.log(this.elementTarget)
    this.elementTarget.classList.toggle("d-none")
  }
}
