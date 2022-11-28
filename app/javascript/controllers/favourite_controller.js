import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static values = {trail: Number}

  connect() {
  }

  bookmarked(event) {
    event.preventDefault();
    const link = event.currentTarget

    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

    fetch(event.currentTarget.href, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    })
      .then(response => response.json())
      .then((data) => {
        link.innerHTML = data
        ? `<i class="fa-regular fa-bookmark fw-bold"></i>`
        : `<i class="fa-regular fa-bookmark"></i>`
      })
  }
}
