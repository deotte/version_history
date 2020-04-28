class Product < ApplicationRecord
  has_many :product_versions, dependent: :destroy
  after_commit :send_changes_to_version_history, if: :persisted?

  private

  def send_changes_to_version_history
    new_version = Hash.new

    self.previous_changes.each do |key, changes|
      new_version[key] = changes.last
    end

    self.product_versions.create!(new_version)
  end
end
