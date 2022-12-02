import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["trails"]

  connect() {
    console.log('connected to scroll stimulus')
  }

  scroll() {
    this.trailsTarget.scrollIntoView({
      block: 'start',
      behavior: 'smooth',
      inline: 'start'
    });
  }
}
