import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-pictures"
export default class extends Controller {
  static targets = ["grid", "picture", "uploaded"]

  connect() {
    // console.log(this.element)
    // console.log(this.gridTarget)
    // console.log(this.pictureTarget)
    // this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
  }

  upload(event) {
    event.preventDefault();
    const submittedFiles = event.target.querySelector("input[type='file']").files

    if (!submittedFiles.length) {
      this.uploadedTarget.innerHTML = "No pictures selected ..."
    } else {
      this.uploadedTarget.innerHTML = "Loading pictures ..."

      fetch(this.pictureTarget.action, {
        method: "POST",
        headers: { "Accept": "application/json" },
        body: new FormData(this.pictureTarget)
      })
        .then(response => response.json())
        .then((data) => {
          if(data.inserted_item) {
            this.pictureTarget.querySelector("input[type='file']").value = ""
            this.gridTarget.innerHTML = data.inserted_item
            this.uploadedTarget.innerHTML = "Picture successfully uploaded"
            this.element.insertAdjacentHTML("afterend",data.popup)
          }
        })
    }
  }
}
