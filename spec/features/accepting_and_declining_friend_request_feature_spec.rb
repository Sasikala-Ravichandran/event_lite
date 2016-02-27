require 'rails_helper'

RSpec.describe "Accepting and Declining Friend Request" do

  let!(:user_1) { create(:user_with_friends, count: 3) }
  let!(:user_2) { create(:user_with_friends, count: 3) }
  let!(:friendship) { create(:friendship, user_id: user_1.id, 
                                            friend_id: user_2.id, verified: false ) }

  def visit_my_friends
    login_as(user_2)
    visit friendship_path(user_2)
  end  

  scenario "user accepts friend request" do
    visit_my_friends
    print page.html
    expect(page).to have_content(user_1.full_name)
    click_link("Accept", match: :first)
    expect(page).to have_content(user_1.full_name)
  end

  scenario "user declines invitation" do
    visit_my_friends
    click_link("Decline", match: :first)
    expect(page).not_to have_content(user_1.full_name)
  end
end
