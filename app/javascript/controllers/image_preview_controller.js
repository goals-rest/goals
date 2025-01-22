import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["image"]

  updatePreview({ target }) {
    const { files } = target

    if(files.length > 0){
      const src = URL.createObjectURL(files[0]);

      this.imageTarget.src = src
    }
  }
}
