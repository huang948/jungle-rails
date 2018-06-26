require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

    scenario "They can see product detail page by clicking on a product" do
      # ACT
      visit root_path

      within first("article.product") do
        first(:link).click
      end
      sleep 3

      expect(page).to have_css 'section.products-show'
      # DEBUG / VERIFY
      save_screenshot 'image.png'
    end

end
