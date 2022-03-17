class Tag < ApplicationRecord
  has_many: :post_tags
  has_many: :posts, through: :post_tags
  
  validates :title, 
    presence: true,
    length: { 
      minimum: 1,
      maximum: 100
    }
end
