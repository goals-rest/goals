module UI
  module Badge
    class DismissButtonComponent < ApplicationComponent
      style do
        base do
          %w[
            size-4 rounded flex items-center justify-center focus:ring-2 group
          ]
        end

        variants {
          color {
            gray {
              %w[
                hover:bg-neutral-200 dark:hover:bg-neutral-500/40
                focus:ring-neutral-300/50
              ]
            }
            red {
              %w[
                hover:bg-red-200 dark:hover:bg-red-500/40
                focus:ring-red-300/50
              ]
            }
            orange {
              %w[
                hover:bg-orange-200 dark:hover:bg-orange-500/40
                focus:ring-orange-300/50
              ]
            }
            yellow {
              %w[
                hover:bg-yellow-200 dark:hover:bg-yellow-500/40
                focus:ring-yellow-300/50
              ]
            }
            green {
              %w[
                hover:bg-green-200 dark:hover:bg-green-500/40
                focus:ring-green-300/50
              ]
            }
            blue {
              %w[
                hover:bg-blue-200 dark:hover:bg-blue-500/40
                focus:ring-blue-300/50
              ]
            }
            indigo {
              %w[
                hover:bg-indigo-200 dark:hover:bg-indigo-500/40
                focus:ring-indigo-300/50
              ]
            }
            purple {
              %w[
                hover:bg-purple-200 dark:hover:bg-purple-500/40
                focus:ring-purple-300/50
              ]
            }
            pink {
              %w[
                hover:bg-pink-200 dark:hover:bg-pink-500/40
                focus:ring-pink-300/50
              ]
            }
            white {
              %w[
                hover:bg-slate-200 dark:hover:bg-white/20
                focus:ring-slate-500/20
              ]
            }
          }
        }

        defaults { { color: :gray } }
      end

      style :icon do
        base do
          %w[
            size-3 flex-shrink-0 hover:cursor-pointer
          ]
        end

        variants {
          color {
            gray {
              %w[
                text-neutral-700 dark:text-neutral-400
                dark:group-hover:text-neutral-300 group-hover:text-neutral-500
              ]
            }
            red {
              %w[
                text-red-700 dark:text-red-400 dark:group-hover:text-red-300
                group-hover:text-red-500
              ]
            }
            orange {
              %w[
                text-orange-700 dark:text-orange-400
                dark:group-hover:text-orange-300 group-hover:text-orange-500
              ]
            }
            yellow {
              %w[
                text-yellow-700 dark:text-yellow-400
                dark:group-hover:text-yellow-300 group-hover:text-yellow-500
              ]
            }
            green {
              %w[
                text-green-700 dark:text-green-400
                dark:group-hover:text-green-300 group-hover:text-green-500
              ]
            }
            blue {
              %w[
                text-blue-700 dark:text-blue-400
                dark:group-hover:text-blue-300 group-hover:text-blue-500
              ]
            }
            indigo {
              %w[
                text-indigo-700 dark:text-indigo-400
                dark:group-hover:text-indigo-300 group-hover:text-indigo-500
              ]
            }
            purple {
              %w[
                text-purple-700 dark:text-purple-400
                dark:group-hover:text-purple-300 group-hover:text-purple-500
              ]
            }
            pink {
              %w[
                text-pink-700 dark:text-pink-400
                dark:group-hover:text-pink-300 group-hover:text-pink-500
              ]
            }
            white {
              %w[
                text-slate-800 group-hover:text-slate-700/80
                dark:text-white/80 dark:group-hover:text-white/80
              ]
            }
          }
        }

        defaults { { color: :gray } }
      end

      attr_reader :as, :color

      def initialize(as: :button, color: nil, **user_attrs)
        @as = as
        @color = color

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style(color:)
        }
      end

      def icon_attrs
        {
          class: style(:icon, color:)
        }
      end
    end
  end
end
