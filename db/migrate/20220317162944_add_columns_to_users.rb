class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :text
    add_column :users, :github_url, :string
    add_column :users, :personal_url, :string
    add_column :users, :favorite_theme, :string
  end
end
