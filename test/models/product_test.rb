require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'updating product works' do
    product = products(:one)
    assert product.update!(price: 2.99, title: "Milk")

    assert_equal ProductVersion.last.price, product.reload.price
    assert_equal ProductVersion.last.title, product.title
  end
end
