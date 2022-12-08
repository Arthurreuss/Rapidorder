import { Controller } from "@hotwired/stimulus";
import { loadScript } from "@paypal/paypal-js";

// Connects to data-controller="checkout"
export default class extends Controller {
  connect() {
    loadScript({
      "client-id":
        "AZ6mg8z-fSKBI8oMSU29gsgDxzw65DUC1lC0VQ5Yq-d-u8sz8rWiTv0wENaimMPhF4x-BRWVoGpZ49Cg",
      currency: "EUR",
    }).then((paypal) => {
      paypal
        .Buttons({
          onApprove: function (data, actions) {
            return actions.order.capture().then(() => {
              window.location.href = "/confirmation";
              // "https://rapidorder/confirmation"
            });
          },
          createOrder: function (data, actions) {
            return actions.order.create({
              purchase_units: [
                {
                  amount: {
                    value: localStorage.getItem("total"),
                  },
                },
              ],
            });
          },
        })
        .render("#paypal-button-container");
    });
  }
}
