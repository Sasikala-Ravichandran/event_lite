require 'rails_helper'

RSpec.feature "Searching for friends" do
  
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user, first_name: 'John', last_name: 'Doe',
                                                    email: 'johnd@example.com') }

  before do 
    login_as(user_1) 
    visit friendship_path(user_1)
  end

  scenario "with first_name" do
    fill_in "search_friend", with: user_2.first_name
    click_button "Look up a friend"
    expect(page).to have_content(user_2.full_name)
  end

  scenario "with last_name" do
    fill_in "search_friend", with: user_2.last_name
    click_button "Look up a friend"
    expect(page).to have_content(user_2.full_name)
  end

  scenario "with email" do
    fill_in "search_friend", with: user_2.email
    click_button "Look up a friend"
    expect(page).to have_content(user_2.full_name)
  end

end