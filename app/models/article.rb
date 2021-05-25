class Article < ApplicationRecord
  scope :ordered_by_id, -> { order(id: :desc) }
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end