class CreateFavoritePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_posts do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
