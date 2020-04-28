class CreateProductVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_versions do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
