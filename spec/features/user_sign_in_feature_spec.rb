require 'rails_helper'

RSpec.feature "Signing In" do

  scenario "with valid credentials" do

    user = create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"
    expect(page).to have_content("Signed in successfully.")
  
  end

  scenario "with invalid credentials" do
    
    visit new_user_session_path
    
    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button "Sign in"
    expect(page).to have_content("Invalid email or password.")
    expect(current_path).to eq(new_user_session_path)
  
  end

end
