import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-category"
export default class extends Controller {
  static targets = ["beers"]

  connect() {
    console.log('hello LEO');
  }

  choose_beers() {
    this.beersTarget.classList.toggle("collapsed")
    toggle("show")
    toggle("")
  }
}
