require 'rails_helper'

RSpec.feature "Creating an event" do

  scenario do
    creator = create(:creator)
    event = build(:event)
    
    login_as(creator)

    visit new_event_path

    fill_in "NAME:", with: event.name
    fill_in "DATE:", with: event.start_date
    fill_in "TIME:", with: event.start_time
    fill_in "VENUE:", with: event.venue

    click_button "Create Event"

    expect(page).to have_content("Event has been created")
  end

end