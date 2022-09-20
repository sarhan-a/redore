import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="auto-type"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
}
