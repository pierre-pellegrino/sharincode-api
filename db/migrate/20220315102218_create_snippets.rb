class CreateSnippets < ActiveRecord::Migration[7.0]
  def change
    create_table :snippets do |t|
      t.text :content
      t.belongs_to :post

      t.timestamps
    end
  end
end
