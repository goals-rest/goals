import { Controller } from '@hotwired/stimulus'

const parseValue = (value) => {
  return parseInt(value) || 0
}

export default class extends Controller {
  static targets = ['value', 'decrementBtn']

  connect() {
    this.disableDecrementIfZero()
  }

  increment(event) {
    event.preventDefault()
    // Increment value by 1
    this.valueTarget.value = parseValue(this.valueTarget.value) + 1
    this.disableDecrementIfZero()
    this.notifyChange()
  }

  decrement(event) {
    event.preventDefault()
    // Decrement value by 1, but ensure it doesn't go below 0
    this.valueTarget.value = Math.max(parseValue(this.valueTarget.value) - 1, 0)
    this.disableDecrementIfZero()
    this.notifyChange()
  }

  disableDecrementIfZero() {
    // Apply or remove classes based on the presence of the "disabled" attribute
    if (this.decrementBtnTarget && this.valueTarget.value == 0) {
      this.decrementBtnTarget.classList.add('pointer-events-none', 'opacity-50')
    } else {
      this.decrementBtnTarget.classList.remove(
        'pointer-events-none',
        'opacity-50'
      )
      this.decrementBtnTarget.removeAttribute('disabled')
    }
  }

  notifyChange() {
    this.dispatch('change', { value: this.valueTarget.value })
  }
}
