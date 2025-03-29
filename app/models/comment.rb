class Comment < ApplicationRecord
  include Entryable

  belongs_to :parent, class_name: "Entry", foreign_key: :entry_id, inverse_of: :comments, touch: true
  has_one :owner, through: :entry

  validates :body, presence: true, length: { maximum: 2200 }

  def extract_handles
    HandleTextParser.new(body).parse
  end
end
