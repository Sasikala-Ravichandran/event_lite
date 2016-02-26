require 'rails_helper'

RSpec.feature "Signing Out" do

  let(:user) { create(:user) }

  scenario "Log out" do

    login_as(user)
    visit user_path(user)
    print page.html
    click_link "Signout"
    expect(page).to have_content("Signed out successfully.")
  
  end
end