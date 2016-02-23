require 'rails_helper'

RSpec.feature "Signing Out" do

  scenario "Log out" do

    user = build(:user)
    login_as build(:user)
    visit root_path
    click_link "logout"
    expect(page).to have_content("Signed out successfully.")
  
  end
end