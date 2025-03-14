module Notifiable
  extend ActiveSupport::Concern

  included do
    has_one :notification, as: :notifiable, touch: true, dependent: :destroy
  end
end
