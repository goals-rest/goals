import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['input', 'output', 'fieldOutput']
  static values = {
    base: {
      type: Number,
      default: 0,
    },
  }

  update() {
    if (!this.hasInputTarget) {
      return
    }

    const valueChange = parseFloat(this.inputTarget.value) || 0
    const result = this.baseValue + valueChange

    this.outputTargets.forEach((output) => (output.innerText = result))
    this.fieldOutputTargets.forEach((output) => (output.value = result))
  }
}
