module UI
  module Badge
    class Component < ApplicationComponent
      renders_one :dismiss_button, UI::Badge::DismissButtonComponent

      style :default do
        base do
          %w[
            font-medium px-2 py-1 text-xs inline-flex items-center
            justify-between space-x-1
          ]
        end

        variants {
          color {
            gray {
              %w[
                bg-neutral-100 text-neutral-800 dark:bg-neutral-500/20
                dark:text-neutral-200
              ]
            }
            red {
              %w[
                bg-red-100 text-red-800 dark:bg-red-500/20
                dark:text-red-200
              ]
            }
            orange {
              %w[
                bg-orange-100 text-orange-800 dark:bg-orange-500/20
                dark:text-orange-200
              ]
            }
            yellow {
              %w[
                bg-yellow-100 text-yellow-800 dark:bg-yellow-500/20
                dark:text-yellow-200
              ]
            }
            green {
              %w[
                bg-green-100 text-green-800 dark:bg-green-500/20
                dark:text-green-200
              ]
            }
            blue {
              %w[
                bg-blue-100 text-blue-800 dark:bg-blue-500/20
                dark:text-blue-200
              ]
            }
            indigo {
              %w[
                bg-indigo-100 text-indigo-800 dark:bg-indigo-500/20
                dark:text-indigo-200
              ]
            }
            purple {
              %w[
                bg-purple-100 text-purple-800 dark:bg-purple-500/20
                dark:text-purple-200
              ]
            }
            pink {
              %w[
                bg-pink-100 text-pink-800 dark:bg-pink-500/20
                dark:text-pink-200
              ]
            }
            white {
              %w[
                bg-white-100 text-slate-800 border-slate-200
                dark:border-none dark:bg-white/10 dark:text-white/80
              ]
            }
          }

          pill {
            yes { "rounded-full" }
            no { "rounded" }
          }
        }

        defaults { { color: :gray, pill: false } }
      end

      style :outline do
        base do
          %w[
            rounded font-medium px-2 py-1 text-xs border inline-flex items-center justify-between space-x-1
          ]
        end

        variants {
          color {
            gray {
              %w[
                text-neutral-800 border-neutral-800/60 bg-neutral-50/60
                dark:bg-neutral-500/20 dark:text-neutral-200 dark:border-neutral-500/40
              ]
            }
            red {
              %w[
                text-red-800 border-red-800/60 bg-red-50/60
                dark:bg-red-500/20 dark:text-red-200 dark:border-red-500/40
              ]
            }
            orange {
              %w[
                text-orange-800 border-orange-800/60 bg-orange-50/60
                dark:bg-orange-500/20 dark:text-orange-200 dark:border-orange-500/40
              ]
            }
            yellow {
              %w[
                text-yellow-800 border-yellow-800/60 bg-yellow-50/60
                dark:bg-yellow-500/20 dark:text-yellow-200 dark:border-yellow-500/40
              ]
            }
            green {
              %w[
                text-green-800 border-green-800/60 bg-green-50/60
                dark:bg-green-500/20 dark:text-green-200 dark:border-green-500/40
              ]
            }
            blue {
              %w[
                text-blue-800 border-blue-800/60 bg-blue-50/60
                dark:bg-blue-500/20 dark:text-blue-200 dark:border-blue-500/40
              ]
            }
            indigo {
              %w[
                text-indigo-800 border-indigo-800/60 bg-indigo-50/60
                dark:bg-indigo-500/20 dark:text-indigo-200 dark:border-indigo-500/40
              ]
            }
            purple {
              %w[
                text-purple-800 border-purple-800/60 bg-purple-50/60
                dark:bg-purple-500/20 dark:text-purple-200 dark:border-purple-500/40
              ]
            }
            pink {
              %w[
                text-pink-800 border-pink-800/60 bg-pink-50/60
                dark:bg-pink-500/20 dark:text-pink-200 dark:border-pink-500/40
              ]
            }
            white {
              %w[
                bg-white-100 text-slate-800 border-slate-400 dark:bg-white/10
                dark:text-white/80 dark:border-white/30
              ]
            }
          }
        }

        defaults { { color: :gray } }
      end

      attr_reader :variant, :color

      def initialize(variant: :default, color: nil, **user_attrs)
        @variant = variant
        @color = color

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style_for(variant)
        }
      end

      private
      def style_for(variant)
        return style(:default, color:, pill: true) if variant == :pill

        style(variant, color:)
      end
    end
  end
end
