class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets
  has_many :comments
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_reactions, dependent: :destroy
  has_many :reactions, through: :post_reactions, dependent: :destroy

  validates :description, length: { maximum: 500 }
end
