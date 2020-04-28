class AddProductIdToProductVersions < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_versions, :product, index: true, foreign_key: true
  end
end
