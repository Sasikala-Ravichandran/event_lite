require 'rails_helper'

RSpec.feature "Signing Up" do

  scenario "with valid credentials" do
    
    visit new_user_registration_path

    fill_in "Email", with: "johndoe@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")

  end

  scenario "with invalid credentials" do
    
    visit new_user_registration_path

    fill_in "Email", with: ""
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"
    expect(page).to have_content("error prohibited this user from being saved:")
  
  end

end