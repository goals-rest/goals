module LoadMoreButton
  class Component < ApplicationComponent
    style do
      base do
        %w[font-heading text-zinc-800 focus:text-primary-600
          relative font-normal hover:transition hover:duration-300
          hover:ease-in-out hover:text-zinc-950 dark:text-white
          dark:hover:text-zinc-300 dark:focus:text-white text-sm
          inline-flex items-center justify-center gap-2
        ]
      end
    end

    def initialize(href: "#", **user_attrs)
      @href = href

      super(**user_attrs)
    end

    def default_attrs
      {
        class: style,
        data: { turbo_stream: true }
      }
    end
  end
end
