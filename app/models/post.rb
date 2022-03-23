class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_reactions, dependent: :destroy
  has_many :reactions, through: :post_reactions

  validates :description, length: { maximum: 500 }
end
