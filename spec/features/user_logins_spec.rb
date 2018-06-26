require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: "huang948",
      email: "jordanhuang99@gmail.com",
      password: "123",
      password_confirmation: "123"
    )
  end

  scenario "changed login value at the top of the navbar" do
    # ACT
    visit root_path
    
    find_link("Login", {href: '/login'}).click
    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end
    sleep 2
    expect(page.find("li.navbar-username").text).to eq("Signed in as huang948")
    # DEBUG / VERIFY
    save_screenshot 'image.png'
  end

end
