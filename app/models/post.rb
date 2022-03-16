class Post < ApplicationRecord
  belongs_to :user
  has_many :snippets

  validates :description, length: { maximum: 500 }
end
