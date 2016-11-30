class AddCategoryToInfluencer < ActiveRecord::Migration
  def change
    add_column :influencers, :category, :text
  end
end
