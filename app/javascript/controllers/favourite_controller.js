import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static values = {trail: Number}

  connect() {
  }

  toggleBookmarkIcon(event) {
    event.preventDefault();
    const link = event.currentTarget

    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

    fetch(link.href, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.redirect) {
          window.location = data.redirect
        } else {
          link.innerHTML = data.favourited
          ? `<i class="fa-regular fa-bookmark fw-bold"></i>`
          : `<i class="fa-regular fa-bookmark"></i>`
        }
      })
  }

  deleteBookmark(event) {
    event.preventDefault();
    const link = event.currentTarget

    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

    fetch(link.href, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    })
      .then(response => response.json())
      .then((data) => { link.parentElement.remove() });
  }

}
