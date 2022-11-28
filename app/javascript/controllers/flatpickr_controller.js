import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['date']

  connect() {
    flatpickr(this.dateTarget, {
      altInput: true,
      enableTime: true,
      inline: true,
      minDate: new Date(),
      minuteIncrement: 5
    })
  }
}
