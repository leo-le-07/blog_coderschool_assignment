class AddViewToArticleWithDefaultValue < ActiveRecord::Migration
  def change
    add_column :articles, :view, :integer, :default => 0
  end
end
