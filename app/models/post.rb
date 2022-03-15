class Post < ApplicationRecord
  belongs_to :user

  validates :description, length: {maximum: 500}
end
