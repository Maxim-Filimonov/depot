require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "add the duplicate products should result in quantity raise" do
    cart = Cart.create
    cart.add_product(line_items(:ruby).product_id).save
    cart.add_product(line_items(:ruby).product_id).save
    assert_equal 1,cart.line_items.length
    assert_equal 2,cart.line_items.first.quantity
  end
end
