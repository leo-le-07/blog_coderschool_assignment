class DeleteViewFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :view
  end
end
