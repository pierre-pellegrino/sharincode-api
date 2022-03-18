class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets
  has_many :comments
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :description, length: { maximum: 500 }
end
