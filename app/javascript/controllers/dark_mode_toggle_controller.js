import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["lightModeIcon", "darkModeIcon"];

  connect() {
    this.#updateTheme();
  }

  get theme() {
    return localStorage.theme;
  }

  set theme(theme) {
    localStorage.theme = theme;
  }

  toggle() {
    this.theme = this.#isLightTheme() ? "dark" : "light";
    this.#onThemeChange();
  }

  #isLightTheme() {
    return !this.theme || this.theme == "light";
  }

  #onThemeChange() {
    this.#updateTheme();
  }

  #updateTheme() {
    if (this.#isLightTheme()) {
      this.#toggleLightMode();
    } else {
      this.#toggleDarkMode();
    }
  }

  #toggleLightMode() {
    document.documentElement.classList.remove("dark");
    this.#showLightModeIcon();
  }

  #toggleDarkMode() {
    document.documentElement.classList.add("dark");
    this.#showDarkModeIcon();
  }

  #showLightModeIcon() {
    this.lightModeIconTarget.classList.remove("hidden");
    this.darkModeIconTarget.classList.add("hidden");
  }

  #showDarkModeIcon() {
    this.darkModeIconTarget.classList.remove("hidden");
    this.lightModeIconTarget.classList.add("hidden");
  }
}
