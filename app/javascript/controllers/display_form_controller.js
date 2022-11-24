import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-form"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log('connected')
    console.log(this.formTarget)
  }

  display(event) {
    console.log(event)
    this.formTarget.classList.toggle('d-none')
  }
}
