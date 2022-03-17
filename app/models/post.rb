class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets
  has_many :comments
  has_one :post_tag, dependent: :destroy
  has_many :tags, through: :post_tag

  validates :description, length: { maximum: 500 }
end
