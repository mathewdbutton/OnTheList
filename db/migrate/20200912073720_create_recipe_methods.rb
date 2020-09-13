class CreateRecipeMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_methods do |t|
      t.string :step
      t.integer :order
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
