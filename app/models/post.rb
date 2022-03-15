class Post < ApplicationRecord
  belongs_to :user
  has_many :snippet

  validates :description, length: { maximum: 500 }
end
