require 'rails_helper'

RSpec.feature "Creating an event" do

  scenario do
    creator = create(:creator)
    event = build(:event)
    
    login_as(creator)

    visit new_event_path

    fill_in "Name", with: event.name
    fill_in "Start date", with: event.start_date
    fill_in "Start time", with: event.start_time
    fill_in "Venue", with: event.venue

    click_button "Create Event"

    expect(page).to have_content("Event has been created")
  end

end