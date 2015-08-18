class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :chef_id, :integer   #table, field added, type
  end
end
