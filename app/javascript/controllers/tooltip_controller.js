import { Controller } from '@hotwired/stimulus'
import { computePosition, flip, shift, offset, arrow } from '@floating-ui/dom'

export default class extends Controller {
  static targets = ['trigger', 'content', 'arrow']
  static values = {
    placement: {
      type: String,
      default: 'top',
    },
  }

  connect() {
    this.#setupEventHandlers()
  }

  disconnect() {
    this.#removeEventHandlers()
  }

  #setupEventHandlers() {
    ;[
      ['mouseenter', this.#showTooltip.bind(this)],
      ['mouseleave', this.#hideTooltip.bind(this)],
      ['focus', this.#showTooltip.bind(this)],
      ['blur', this.#hideTooltip.bind(this)],
    ].forEach(([event, handler]) => {
      this.triggerTarget.addEventListener(event, handler)
    })
  }

  #removeEventHandlers() {
    ;[
      ['mouseenter', this.#showTooltip.bind(this)],
      ['mouseleave', this.#hideTooltip.bind(this)],
      ['focus', this.#showTooltip.bind(this)],
      ['blur', this.#hideTooltip.bind(this)],
    ].forEach(([event, handler]) => {
      this.triggerTarget.removeEventListener(event, handler)
    })
  }

  #showTooltip() {
    this.contentTarget.classList.remove('invisible')
    this.contentTarget.classList.remove('opacity-0')
    this.#update()
  }

  #hideTooltip() {
    this.contentTarget.classList.add('invisible')
    this.contentTarget.classList.add('opacity-0')
    this.#update()
  }

  #update() {
    computePosition(this.triggerTarget, this.contentTarget, {
      placement: this.placementValue,
      middleware: this.#build_middleware(),
    }).then(this.#handleComputePosition.bind(this))
  }

  #handleComputePosition({ x, y, placement, middlewareData }) {
    Object.assign(this.contentTarget.style, {
      left: `${x}px`,
      top: `${y}px`,
    })

    if (this.hasArrowTarget) {
      this.#updateArrowPlacement(middlewareData.arrow, placement)
    }
  }

  #updateArrowPlacement({ x, y }, placement) {
    const staticSide = {
      top: 'bottom',
      right: 'left',
      bottom: 'top',
      left: 'right',
    }[placement.split('-')[0]]

    Object.assign(this.arrowTarget.style, {
      left: x != null ? `${x}px` : '',
      top: y != null ? `${y}px` : '',
      right: '',
      bottom: '',
      [staticSide]: '-4px',
    })
  }

  #build_middleware() {
    return [
      offset(6),
      flip(),
      shift({ padding: 5 }),
      this.hasArrowTarget && arrow({ element: this.arrowTarget }),
    ].filter(Boolean)
  }
}
