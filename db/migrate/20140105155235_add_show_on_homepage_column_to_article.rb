class AddShowOnHomepageColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :show_on_homepage, :boolean
  end
end
