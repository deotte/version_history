class RemoveUpdatedAtFromProductVersions < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_versions, :updated_at, :datetime
  end
end
