require 'rails_helper'

RSpec.feature "Deleting an event" do

  let(:john) { create(:creator) }
  let(:maxy) { create(:user) }
  let(:event) { create(:event, creator_id: john.id) }

  scenario "with an user who created the event" do
    login_as(john)
    visit event_path(event)
    click_link "Delete"
    expect(page).to have_content("Event has been deleted")
    expect(current_path).to eq(events_path)
  end

  scenario "with any logged in user" do
    login_as(maxy)
    visit event_path(event)
    expect(page).not_to have_link("Delete")
  end
end