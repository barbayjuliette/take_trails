import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-pictures"
export default class extends Controller {
  static targets = ["grid", "picture"]

  connect() {
    // console.log(this.element)
    // console.log(this.gridTarget)
    // console.log(this.pictureTarget)
    // this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
    console.log(this.pictureTarget.querySelector("input[type='file']"))
  }

  upload(event) {
    // console.log(event)
    event.preventDefault()

    //console.log("TODO: send request in AJAX")


    fetch(this.pictureTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.pictureTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if(data.inserted_item) {
          console.log(this.pictureTarget.querySelector("input[type='file']") );
          this.pictureTarget.querySelector("input[type='file']").value = ""
          this.gridTarget.insertAdjacentHTML('beforeend', data.inserted_item)
        }
      })
  }
}
