import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "count", "userreview", "overallrating"]

  connect() {
    console.log('Connected to insert-in-list controller')
    console.dir(this.countTarget)
  }

  send(event) {
    event.preventDefault()

  fetch(this.formTarget.action, {
    method: "POST",
    headers: { "Accept": "application/json" },
    body: new FormData(this.formTarget)
  })
    .then(response => response.json())
    .then((data) => {
      // if (data.success) {
        // in modal
        this.formTarget.innerHTML = `
          <div class=''>
            <br>
            <h3 class="submitted">Thanks for submitting a review!</h3>
          </div>
        `
        let newCount = this.countTarget.innerText.match(/\d+/)

        if (newCount) {
          this.countTarget.innerHTML = `<h2><strong>${Number(newCount[0])+1} reviews</strong></h2>`
        } else {
          this.countTarget.innerHTML = "<h2><strong>1 review</strong></h2>"
        }

        this.itemsTarget.insertAdjacentHTML("afterbegin", data.reviewcard);

        // on show page
        document.querySelector("#no-review").classList.add('d-none');

        this.userreviewTarget.insertAdjacentHTML("afterbegin", data.userreviewcard);

        this.overallratingTarget.innerHTML = data.overallrating
      }
      // else {
      //   console.log("FAILED")
      // }
    // }
    )
}
}
