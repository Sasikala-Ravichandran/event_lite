require 'rails_helper'

RSpec.feature "Showing an event" do

  let(:creator) { create(:creator) }
  let(:event) { create(:event, creator_id: creator.id) }

  scenario "with non logged in user" do
    visit event_path(event)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "with logged in user" do
    login_as(creator)
    visit event_path(event)
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.venue)
    expect(current_path).to eq(event_path(event))
  end

  scenario "with user who created events" do
    login_as(creator)
    visit event_path(event)
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.venue)
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
    expect(current_path).to eq(event_path(event))
  end
end