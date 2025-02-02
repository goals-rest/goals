class Post < ApplicationRecord
  includes Entryable

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 60 }
end
