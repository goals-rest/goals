const presets = require("railsui-tailwind-presets");
const execSync = require("child_process").execSync;
const outputRailsUI = execSync("bundle show railsui", { encoding: "utf-8" });
const rails_ui_path = outputRailsUI.trim() + "/**/*.rb";
const rails_ui_template_path = outputRailsUI.trim() + "/**/*.html.erb";

module.exports = {
  darkMode: "selector",
  presets: [presets.shepherd],
  content: [
    "./config/initializers/railsui_icon.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/components/**/*.html.erb",
    "./app/components/**/*.rb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.html.erb",
    rails_ui_path,
    rails_ui_template_path,
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "Inter",
          "ui-sans-serif",
          "system-ui",
          "sans-serif",
          "Apple Color Emoji",
          "Segoe UI Emoji",
          "Segoe UI Symbol",
          "Noto Color Emoji",
        ],
      },
      keyframes: {
        "toast-from-right": {
          "0%": { transform: "translateX(50%)", opacity: "0%" },
          "100%": { transform: "translateX(0)", opacity: "100%" },
        },
        "toast-from-left": {
          "0%": { transform: "translateX(-50%)", opacity: "0%" },
          "100%": { transform: "translateX(0)", opacity: "100%" },
        },
      },
      animation: {
        "toast-from-right":
          "toast-from-right 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55)",
        "toast-from-left":
          "toast-from-left 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55)",
      },
    },
  },
};
