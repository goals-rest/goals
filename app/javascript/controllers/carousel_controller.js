import { Controller } from '@hotwired/stimulus'
import EmblaCarousel from 'embla-carousel'

const DEFAULT_OPTIONS = {
  loop: false,
}

export default class extends Controller {
  static targets = ['previousButton', 'nextButton', 'indicator']
  static values = {
    options: {
      type: Object,
      default: {},
    },
  }

  connect() {
    this.initCarousel()
  }

  disconnect() {
    this.carousel.destroy()
  }

  initCarousel() {
    this.carousel = EmblaCarousel(this.element, this.#mergedOptions)
    this.carousel.on('select', this.#handleSelect.bind(this))
    this.carousel.on('init', this.#handleInit.bind(this))
    this.carousel.on('reInit', this.#handleInit.bind(this))
  }

  next() {
    this.carousel.scrollNext()
  }

  previous() {
    this.carousel.scrollPrev()
  }

  #handleSelect() {
    this.#updateButtonsVisibility()
    this.#updateIndicators()
  }

  #handleInit() {
    this.#updateButtonsVisibility()
    this.#updateIndicators()
  }

  #updateButtonsVisibility() {
    this.#toggleButtonsVisibility(
      this.nextButtonTargets,
      this.carousel.canScrollNext()
    )

    this.#toggleButtonsVisibility(
      this.previousButtonTargets,
      this.carousel.canScrollPrev()
    )
  }

  #updateIndicators() {
    this.indicatorTargets.forEach((indicator) => {
      const { slide } = indicator.dataset
      const isIndicatorActive = this.carousel.selectedScrollSnap() == slide - 1

      indicator.dataset.active = isIndicatorActive
    })
  }

  #toggleButtonsVisibility(buttons, isVisible) {
    if (isVisible) {
      buttons.forEach((button) => button.classList.remove('hidden'))
    } else {
      buttons.forEach((button) => button.classList.add('hidden'))
    }
  }

  get #mergedOptions() {
    return {
      ...DEFAULT_OPTIONS,
      ...this.optionsValue,
    }
  }
}
