import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password"
export default class extends Controller {
  static targets = ["reset"]

  connect() {
    console.log();
  }

  password() {
    this.resetTarget.innerHTML = "Reset link sent! Please check your email."
    }
}
