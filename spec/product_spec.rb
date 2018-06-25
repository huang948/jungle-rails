require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.find_or_create_by! name: 'Apparel'
     end
  describe 'Validations' do
    it 'should successfully save' do
      @category = Category.find_or_create_by! name: 'Apparel'
      @product = @category.products.create(
        name: 'yeezy',
        description: "These are very stylish",
        image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg',
        price: 2000,
        quantity: 10)

      expect(@product).to be_valid
    end

    it 'should have a name' do
      @product = @category.products.create(
        description: "These are very stylish",
        image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg',
        price: 2000,
        quantity: 10)
      expect(@product).to_not be_valid
    end

    it 'should have a price' do
      @product = @category.products.create(
        name: 'yeezy',
        description: "These are very stylish",
        image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg',
        quantity: 10)
      expect(@product).to_not be_valid
    end

    it 'should have a quantity' do
      @product = @category.products.create(
        name: 'yeezy',
        description: "These are very stylish",
        image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg',
        price: 2000
        )
      expect(@product).to_not be_valid
    end

    it 'should have a category' do
      @product = Product.create(
        name: 'yeezy',
        description: "These are very stylish",
        image: 'https://images-na.ssl-images-amazon.com/images/I/71ppM12t7NL._UX395_.jpg',
        price: 2000,
        quantity: 10)
      expect(@product).to_not be_valid
    end

  end
end