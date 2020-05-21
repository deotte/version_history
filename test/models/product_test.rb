require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'updating product works' do
    product = products(:one)
    assert product.update!(price: 2.99, title: "Milk")

    assert_equal ProductVersion.last.price, product.reload.price
    assert_equal ProductVersion.last.title, product.title
  end

  test 'updating product works without label in version history' do
    product = products(:one)
    assert product.update!(price: 2.99, title: "Milk", label: "MSG 987")
    
    assert_equal ProductVersion.last.price, product.reload.price
    assert_equal ProductVersion.last.title, product.title
    assert_not ProductVersion.last.label.present?
  end
end
