class Comment < ApplicationRecord
  include Entryable

  alias_attribute :content, :body

  belongs_to :parent, class_name: "Entry", foreign_key: :entry_id, inverse_of: :comments, touch: true

  has_one :owner, through: :entry
  has_many :notification_comments, class_name: "Notification::Comment", dependent: :destroy, foreign_key: :entry_id

  validates :body, presence: true, length: { maximum: 2200 }

  def extract_handles
    HandleTextParser.new(body).parse
  end
end
