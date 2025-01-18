import { Controller } from "@hotwired/stimulus";
import { useTransition, useClickOutside } from "stimulus-use";

export default class extends Controller {
  static targets = ["container", "content"];
  static values = {
    open: {
      type: Boolean,
      default: false,
    },
    static: {
      type: Boolean,
      default: false,
    },
  };

  connect() {
    useTransition(this, {
      element: this.contentTarget,
    });

    useClickOutside(this, {
      element: this.contentTarget,
    });

    if (this.openValue) {
      this.open();
    }
  }

  open(event) {
    if (event) {
      event.preventDefault();
    }

    this.enableAppearance();
    this.toggleTransition();
  }

  close(event) {
    if (event) {
      event.preventDefault();
    }

    this.leave();
    this.disableAppearance();
  }

  clickOutside(event) {
    if (this.staticValue) {
      return;
    }

    const action = event.target.dataset.action;
    if (
      action == "click->modal#open" ||
      action == "click->modal#open:prevent"
    ) {
      return;
    }
    this.close(event);
  }

  closeWithEsc(event) {
    if (
      event.keyCode === 27 &&
      !this.containerTarget.classList.contains("hidden")
    ) {
      this.close(event);
    }
  }

  enableAppearance() {
    this.containerTarget.classList.add("bg-black/80");
    this.containerTarget.classList.remove("hidden");
  }

  disableAppearance() {
    this.containerTarget.classList.add("hidden");
    this.containerTarget.classList.remove("bg-black/80");
  }

  disconnect() {
    this.toggleTransition();
  }
}
