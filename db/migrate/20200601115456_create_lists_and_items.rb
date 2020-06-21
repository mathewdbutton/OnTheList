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
      t.index :name
      t.timestamps
    end
    create_table :list_items do |t|
      t.references :list
      t.references :item
      t.integer :quantity
      t.timestamps
    end
  end
end
