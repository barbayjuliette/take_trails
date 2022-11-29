import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "blank", "count", "userreview"]

  send(event) {
    event.preventDefault()

  fetch(this.formTarget.action, {
    method: "POST",
    headers: { "Accept": "application/json" },
    body: new FormData(this.formTarget)
  })
    .then(response => response.json())
    .then((data) => {
      if (data.success) {
        this.itemsTarget.insertAdjacentHTML("afterbegin", `
         <div class="review">
              <div class="user-info">
                <i class="fa-solid fa-circle-user avatar"></i>
              <div>
                <h4>${data.reviewer}</h4>
                <p>${data.created_at}</p>
              </div>
              <div class="rating">
          <h4>${data.rating}<i class="fa-solid fa-star"></i> </h4>
        </div>
            </div>
            <div class="reviews review-size">
              ${data.review}
            </div>
          </div>
        `);

        this.userreviewTarget.insertAdjacentHTML("afterbegin", `
        <div id="show-pg-review-card" class="review mb-2" style="width: 100%">
          <div class="user-info">
            <i id="show-pg-user-avatar" class="fa-solid fa-circle-user avatar"></i>
            <div>
              <h4>Your review</h4>
              <p class="mt-0">${data.created_at}</p>
            </div>
            <div class="rating">
              <h5>${data.rating}<i class="fa-solid fa-star"></i></h5>
            </div>
          </div>
          <div class="reviews review-size">
            ${data.review}
          </div>
        </div>
        `);

        document.querySelector("#no-review").classList.add('d-none');

        this.formTarget.innerHTML = `
          <div class=''>
          <br>
            <h3 class="submitted">Thanks for submitting a review!</h3>
          </div>
        `

        this.blankTarget.innerHTML = ``

        let newCount = 0

        if (this.countTarget.innerHTML) {
          newCount = this.countTarget.innerHTML.match(/\d+/)[0]
          this.countTarget.innerHTML = (Number(newCount)+1) + " reviews"
        } else {
          this.countTarget.innerHTML = "1 review"
        }

        document.querySelector("#main_review_count").innerHTML = (Number(newCount)+1) + " reviews"


      } else {
        console.log("FAILED")
      }
      // if (data.inserted_item) {
      //   this.itemsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
      // })
      // this.formTarget.outerHTML = data.form
    })
}
}
