class AddLanguagesToSnippet < ActiveRecord::Migration[7.0]
  def change
    add_column :snippets, :language, :string
  end
end
