import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-tabs"
export default class extends Controller {
  static targets = ['upcomingbutton', 'pastbutton', 'upcomingtrips', 'pasttrips']

  connect() {
    console.log('connected to switch tabs')
  }

  upcoming(event) {
    this.pastbuttonTarget.classList.remove('active');
    this.upcomingbuttonTarget.classList.add('active');
    this.pasttripsTarget.classList.add('d-none');
    this.upcomingtripsTarget.classList.remove('d-none');
  }

  past(event) {
    this.upcomingbuttonTarget.classList.remove('active');
    this.pastbuttonTarget.classList.add('active');
    this.upcomingtripsTarget.classList.add('d-none');
    this.pasttripsTarget.classList.remove('d-none');
  }
}
