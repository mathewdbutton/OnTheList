class CreateModelRecipeItems < ActiveRecord::Migration[6.0]
  def change
    create_table :model_recipe_items do |t|
      t.string :quantity
      t.references :recipe_method, null: false, foreign_key: true
      t.references :recipe_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
