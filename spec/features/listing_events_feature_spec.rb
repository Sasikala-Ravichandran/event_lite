require 'rails_helper'

RSpec.feature "Lisiting events" do

  let(:user) { create(:user) }
  let(:event_1) { create(:event) }
  let(:event_2) { create(:event) }

  scenario "with non logged in user" do
    visit events_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "with logged in user" do
    login_as(user)
    visit events_path
    expect(page).to have_content("All Events")
    expect(current_path).to eq(events_path)
  end
end