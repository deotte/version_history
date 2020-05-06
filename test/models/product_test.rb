require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'updating product works' do
    product = products(:one)
    assert product.update!(price: 2.99, title: "Milk")
    assert ProductVersion.where(product_id: product.id).present?
  end
end
