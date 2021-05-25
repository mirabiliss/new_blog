class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  include Visible

  has_many :comments, dependent: :destroy
  has_many :taggings 
  has_many :tags, through: :taggings 

  scope :ordered_by_id, -> { order(id: :desc) }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

end