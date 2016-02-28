require 'rails_helper'

RSpec.feature "Sending Friend Request" do
  
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }  

  scenario do
    login_as(user_1)
    visit friendship_path(user_1)
    fill_in "search_friend", with: user_2.first_name
    click_button "Look up a friend"
    click_link "Request"
    expect(page).to have_content(user_2.full_name)
    expect(page).to have_content("Friend Request Sent")
  end

end