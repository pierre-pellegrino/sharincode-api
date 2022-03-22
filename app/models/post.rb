class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :description, length: { maximum: 500 }
end
