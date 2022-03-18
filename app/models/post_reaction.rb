class PostReaction < ApplicationRecord
  belongs_to :reaction
  belongs_to :post
  belongs_to :user
end
