class AddLabelToProductVersions < ActiveRecord::Migration[6.0]
  def change
    add_column :product_versions, :label, :string
  end
end
