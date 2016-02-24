require 'rails_helper'

RSpec.feature "Editing an event" do

  let(:john) { create(:creator) }
  let(:maxy) { create(:user) }
  let(:event) { create(:event, creator_id: john.id) }

  scenario "with an user who created the event" do
    login_as(john)
    visit edit_event_path(event)
    fill_in "Name", with: "#{event.name} edited"
    fill_in "Start date", with: event.start_date
    fill_in "Start time", with: event.start_time
    fill_in "Venue", with: event.venue
    click_button "Update Event"
    expect(page).to have_content("Event has been updated")
  end

  scenario "with any logged in user" do
    login_as(maxy)
    visit edit_event_path(event)
    expect(page).to have_content("You are not allowed to do this")
  end
end