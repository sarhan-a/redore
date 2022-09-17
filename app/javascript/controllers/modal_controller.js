import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    let myModal = document.getElementById("myModal");
    let myInput = document.getElementById("myInput");

    myModal.addEventListener("shown.bs.modal", function () {
      myInput.focus();
    });
  }
}
