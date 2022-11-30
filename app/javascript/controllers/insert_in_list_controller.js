import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "blank", "count", "userreview", "overallrating"]

  connect() {
    console.dir(this.overallratingTarget)
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
        let newCount = 0

        if (this.countTarget.innerHTML) {
          newCount = this.countTarget.innerHTML.match(/\d+/)[0]
          this.countTarget.innerHTML = (Number(newCount)+1) + " reviews"
        } else {
          this.countTarget.innerHTML = "1 review"
        }

        this.itemsTarget.insertAdjacentHTML("afterbegin", data.reviewcard);

        this.blankTarget.innerHTML = ``

        // document.querySelector("#main_review_count").innerHTML = (Number(newCount)+1) + " reviews"

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
