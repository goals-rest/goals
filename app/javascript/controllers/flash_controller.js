import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    if (this.element) {
      setTimeout(() => {
        this.element.remove()
      }, 4000)
    }
  }
}
