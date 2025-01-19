import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output", "fieldOutput"];
  static values = {
    base: {
      type: Number,
      default: 0,
    },
  };

  update({ target }) {
    const valueChange = parseFloat(target.value) || 0;
    const result = this.baseValue + valueChange;

    this.outputTargets.forEach((output) => (output.innerText = result));
    this.fieldOutputTargets.forEach((output) => (output.value = result));
  }
}
