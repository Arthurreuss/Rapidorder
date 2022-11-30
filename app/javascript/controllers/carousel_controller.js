// import { Controller } from "@hotwired/stimulus"
import Carousel from 'stimulus-carousel'

// Connects to data-controller="carousel"
export default class extends Carousel {
  connect() {
    console.log('we are connected')
  }
}
