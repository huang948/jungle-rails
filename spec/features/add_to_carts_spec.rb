require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They see all products" do
    # ACT
    visit root_path
    
    within first(".product") do 
      first(:link, "Add").click
    end
    
    expect(page.find_link("My Cart", {href: "/cart"}).text).to eq("My Cart (1)")
    # DEBUG / VERIFY
    save_screenshot 'image.png'
  end

end
