import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="multiple-image-preview"
export default class extends Controller { static targets = ["previewTemplate", "previewContainer", "imagePreview"]
  static values = {
    directUploadUrl: {
      type: String
    },
    fileInputName: {
      type: String
    },
    acceptedFileTypes: {
      type: Array,
      default: []
    },
    maxImages: {
      type: Number,
      default: null
    }
  }

  handleFileChange(e) {
    e.preventDefault()

    this.#handleFiles(e.target.files)
  }

  handleDragOver(e) {
    e.preventDefault()
  }

  handleFileDrop(e) {
    e.preventDefault()

    this.#handleFiles(e.dataTransfer.files)
  }

  #handleFiles(files) {
    Array.from(files).forEach(file => this.#handleFile(file))
  }

  #handleFile(file) {
    if (!this.#canAddImagePreview()) {
      return
    }

    this.#addImagePreview(file)
  }

  #canAddImagePreview() {
    if (!this.maxImagesValue) {
      return true
    }

    return this.imagePreviewTargets.length < this.maxImagesValue
  }

  #addImagePreview(file) {
    const preview = this.#createPreview({
      file,
      directUploadUrl: this.directUploadUrlValue,
      inputName: this.fileInputNameValue
    })

    this.previewContainerTarget.appendChild(preview)
  }

  #createPreview({ file, directUploadUrl, inputName }) {
    const clone = this.previewTemplateTarget.content.cloneNode(true)

    const imageSrc = URL.createObjectURL(file)
    const image = clone.querySelector("img")
    image.src = imageSrc

    const dataTransfer = new DataTransfer()
    dataTransfer.items.add(file)

    const fileInput = clone.querySelector("input[type='file']")
    fileInput.name = inputName
    fileInput.files = dataTransfer.files
    fileInput.dataset.directUploadUrl = directUploadUrl

    return clone
  }
}
