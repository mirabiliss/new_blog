class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  include Visible

  has_many :comments, dependent: :destroy

  scope :ordered_by_id, -> { order(id: :desc) }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end