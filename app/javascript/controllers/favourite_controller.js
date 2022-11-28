import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static values = {trail: Number}

  connect() {
    console.log("inside")
  }

  bookmarked(event) {
    event.preventDefault();
    console.log("bookmark clicked");
    const link = event.currentTarget

    console.log(event.currentTarget.href);

    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

    fetch(event.currentTarget.href, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    })
      .then(response => response.json())
      .then((data) => {
        // find the div with this.trailValue
        // console.log(document.querySelector(`div[data-favourite-trail-value="${this.trailValue}" i`))
        link.innerHTML = data
        ? `<i class="fa-regular fa-bookmark fw-bold"></i>`
        : `<i class="fa-regular fa-bookmark"></i>`

        // find the i tag inside

        // if data is true
        // set i tag to have class fw-bold

        // if data is false
        // set i tag to have no class fw-bold
      })
  }
}
