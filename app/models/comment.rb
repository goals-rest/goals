class Comment < ApplicationRecord
  include Entryable

  belongs_to :entry, touch: true
  has_one :owner, through: :entry

  validates :body, presence: true, length: { maximum: 2200 }
end
