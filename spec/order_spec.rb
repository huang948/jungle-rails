require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'After creation' do

    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.find_or_create_by! name: 'Apparel'
      @product1 = @category.Product.create!(
        name: "yeezy",
        price: 2000,
        quantity: 10
      )
      @product2 = @category.Product.create!(
        name: "supreme",
        price: 350,
        quantity: 20
      )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    xit 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'jordanhuang99@gmail.com',
        total_cents: 200000,

      )
      # 2. build line items on @order
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end

  end

end