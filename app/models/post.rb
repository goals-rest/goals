class Post < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 60 }
end
