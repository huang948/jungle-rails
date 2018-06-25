require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @category = Category.find_or_create_by! name: 'Apparel'
    @product = @category.products.create!(name: 'yeezy', description: "These are very stylish", image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg', price: 200000, quantity: 10)
  end
  describe 'Validations' do
    it 'should successfully save' do
      @category = Category.find_or_create_by! name: 'Apparel'
      @product = @category.products.create!(name: 'yeezy', description: "These are very stylish", image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg', price: 200000, quantity: 10)
    end

    it 'should have a name' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'should have a price' do
      @product.price = nil
      expect(@product).to_not be_valid
    end

    it 'should have a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'should have a category' do
      @product.category_id = nil
      expect(@product).to_not be_valid
    end

  end
end