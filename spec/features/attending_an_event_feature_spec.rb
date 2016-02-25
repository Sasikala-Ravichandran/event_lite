require 'rails_helper'

RSpec.describe "Attending an event" do

  let!(:event) { create(:event, name: "Women who code") }
  let!(:user) { create(:user_with_attending_events, events_count: 3) }

  def visit_my_page 
    login_as(user)
    visit root_path
    click_link "My Page"
  end  

  scenario "user searches for event which already accepted invitation" do
    visit_my_page
    user_event = user.events.first
    fill_in "search", with: user_event.name
    #print page.html
    click_button "Look up a event"
    expect(page).to have_content(user_event.name)
    expect(page).to have_link("View")
    expect(page).not_to have_link("Attend")
  end

  scenario "user searches for event for which has not accepted invitation" do
    visit_my_page
    fill_in "search", with: "who"
    click_button "Look up a event"
    expect(page).to have_content(event.name)
    expect(page).to have_link("View")
    expect(page).to have_link("Attend")
  end


end
