class Snippet < ApplicationRecord
  belongs_to :post

  validates :content, presence: true, length: { maximum: 3000 }
end
