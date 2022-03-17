class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets
  has_many :comments

  validates :description, length: { maximum: 500 }
end
