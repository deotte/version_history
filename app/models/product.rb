class Product < ApplicationRecord
  include VersionHistory

  NON_VERSIONED_ATTRIBUTES = %w[label].freeze

  has_many :product_versions, dependent: :destroy

  after_commit -> { send_changes_to_version_history(self) }, if: :persisted?
end
