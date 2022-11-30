import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log(this.element)
    }

  //   show() {
  //     alert("Hey from Stimulus");
  // }
    onSubmit() {
      console.log(this.element)
    event.preventDefault(); //prevents page refresh on submit

    const description = document.getElementById('testing'); //get the input field
    description.value = ''; //clear the input field

    }


    toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content

        fetch(`/tasks/${id}/toggle`, {
            method: 'POST', // *GET, POST, PUT, DELETE, etc.
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify({ completed: e.target.checked }) // body data type must match "Content-Type" header
        })
            .then(response => response.json())
            // .then(data => {
            //     alert(data.message)
            // })
    }


}
