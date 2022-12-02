import { Controller } from "@hotwired/stimulus"
import html2pdf from 'html2pdf.js'

// Connects to data-controller="download-qr-code"
export default class extends Controller {

  connect() {

  }

  download() {
  //   // console.log("Hello from download")
  //   // var element = document.getElementsById("element-to-print");
  //   // console.log(this.element);
   html2pdf(this.element.innerHTML);
  }

}
