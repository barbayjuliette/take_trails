import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
    }

    send(event) {
      event.preventDefault()

      console.log("TODO: send request in AJAX")
    }

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })


    toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content

        fetch(`/tasks/${id}/toggle`, {
            method: 'POST', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify({ completed: e.target.checked }) // body data type must match "Content-Type" header
        })
          .then(response => response.json())
          .then(data => {
             alert(data.message)
           })
    }
}
