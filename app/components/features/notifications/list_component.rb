module Notifications
  class ListComponent < ApplicationComponent
    style :unread_indicator do
      base do
        %w[w-2 h-2 bg-red-500 rounded-full hover:animate-pulse absolute top-0
          right-0 z-20 dark:bg-primary-500/95
        ]
      end
    end

    style :list_wrapper do
      base do
        %w[origin-to-right md:absolute mt-2 ml-2 md:ml-0 md:mt-0 md:shadow-xl sm:w-[360px]
          md:min-w-[360px] divide-y text-left dark:divide-zinc-700 transition transform
          md:origin-top-right origin-top-left absolute right-0 top-12 bg-white rounded-lg
          shadow-xl shadow-zinc-900/10 border border-zinc-200 md:w-[320px] w-full z-50
          dark:bg-zinc-900 dark:shadow-zinc-900/50 dark:border-zinc-500/60
          md:text-sm text-base font-medium text-zinc-600 dark:text-zinc-200
        ]
      end
    end

    style :view_all_button do
      base do
        %w[flex items-center justify-between group px-4 py-4
          hover:text-primary-500 text-sm group font-medium text-zinc-500
          dark:text-zinc-200 dark:hover:bg-zinc-800 dark:hover:text-white
        ]
      end
    end

    def initialize(user_notifications: [], href: "#", **user_attrs)
      @user_notifications = user_notifications
      @href = href
      super(**user_attrs)
    end

    private

    attr_reader :user_notifications, :href

    def unread_notifications?
      return if user_notifications.empty?

      user_notifications.where(read_at: nil).exists?
    end
  end
end
