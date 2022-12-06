import { Controller } from "@hotwired/stimulus";
import { loadScript } from "@paypal/paypal-js";

// Connects to data-controller="checkout"
export default class extends Controller {
  connect() {
    loadScript({
      "client-id":
        "AZ6mg8z-fSKBI8oMSU29gsgDxzw65DUC1lC0VQ5Yq-d-u8sz8rWiTv0wENaimMPhF4x-BRWVoGpZ49Cg",
    }).then((paypal) => {
      paypal.Buttons().render("#paypal-button-container");
      setTimeout(() => {
        window.location.href = "http://localhost:3000/confirmation";
      }, 10000);
    });
  }
}
