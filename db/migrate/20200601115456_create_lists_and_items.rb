class CreateListsAndItems < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.integer :quantity
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
