import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["get"]

  connect() {
    console.log("fuck you stimulus")
  }

  get()
}