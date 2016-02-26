require 'rails_helper'

RSpec.feature "Lisiting events" do

  let(:creator) { create(:creator) }
  let(:event_1) { create(:event) }
  let(:event_2) { create(:event) }

  scenario "with non logged in user" do
    visit events_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "with logged in user" do
    login_as(creator)
    visit events_path
    expect(page).to have_content("HOSTING EVENTS")
    expect(page).to have_content("ATTENDING EVENTS")
    expect(page).to have_content("ATTENDED EVENTS")
    expect(page).to have_content("INVITED EVENTS")
    expect(current_path).to eq(events_path)
  end
end