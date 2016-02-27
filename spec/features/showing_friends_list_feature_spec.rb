require 'rails_helper'

RSpec.describe "Showing friends" do

  let!(:friend) { create(:friend) }
  let!(:user) { create(:user_with_friends, count: 3) }

  def visit_my_friend
    login_as(user)
    visit root_path
    click_link "My Friends"
  end  

  scenario do
    visit_my_friend
    user_friend_1 = user.friends.first
    user_friend_2 = user.friends.second
    expect(page).to have_content("My Friends")
    print page.html
    expect(page).to have_content(user_friend_1.full_name)
    expect(page).to have_content(user_friend_2.full_name)
  end

end