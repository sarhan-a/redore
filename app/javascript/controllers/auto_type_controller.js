import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="auto-type"
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    const typed = new Typed(".type", {
      strings: ["Recycle", "Donate", "Restore"],
      typeSpeed: 120,
      backSpeed: 80,
      loop: true,
    });
  }
}
