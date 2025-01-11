import { application } from "../application"

import AutoExpandTextAreaController from "./auto_expand_text_area_controller";
application.register("auto-expand-text-area", AutoExpandTextAreaController);
import CounterInputController from "./counter_input_controller";
application.register("counter-input", CounterInputController);
import DarkModeController from "./dark_mode_controller";
application.register("dark-mode", DarkModeController);
import GalleryController from "./gallery_controller";
application.register("gallery", GalleryController);
import HelpSearchController from "./help_search_controller";
application.register("help-search", HelpSearchController);
import InboxController from "./inbox_controller";
application.register("inbox", InboxController);
import InsightChartController from "./insight_chart_controller";
application.register("insight-chart", InsightChartController);
import InsightsController from "./insights_controller";
application.register("insights", InsightsController);
import NavController from "./nav_controller";
application.register("nav", NavController);
import PricingController from "./pricing_controller";
application.register("pricing", PricingController);
import PropertiesController from "./properties_controller";
application.register("properties", PropertiesController);
import ScrollSpyController from "./scroll_spy_controller";
application.register("scroll-spy", ScrollSpyController);
import SearchController from "./search_controller";
application.register("search", SearchController);
import SelectAllController from "./select_all_controller";
application.register("select-all", SelectAllController);
import SmoothScrollController from "./smooth_scroll_controller";
application.register("smooth-scroll", SmoothScrollController);
import VisibilityController from "./visibility_controller";
application.register("visibility", VisibilityController);

import { RailsuiClipboard, RailsuiCountUp, RailsuiDateRangePicker, RailsuiDropdown, RailsuiModal, RailsuiTabs, RailsuiToast, RailsuiToggle, RailsuiTooltip } from 'railsui-stimulus'

application.register('railsui-clipboard', RailsuiClipboard)
application.register('railsui-count-up', RailsuiCountUp)
application.register('railsui-date-range-picker', RailsuiDateRangePicker)
application.register('railsui-dropdown', RailsuiDropdown)
application.register('railsui-modal', RailsuiModal)
application.register('railsui-tabs', RailsuiTabs)
application.register('railsui-toast', RailsuiToast)
application.register('railsui-toggle', RailsuiToggle)
application.register('railsui-tooltip', RailsuiTooltip)
