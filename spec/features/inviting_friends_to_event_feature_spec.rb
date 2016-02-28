require 'rails_helper'

RSpec.feature "Invite friends" do

  let(:user) { create(:user_with_friends) }
  let(:event) { create(:event) }

  scenario do
    login_as(user)
    visit new_event_path
    fill_in "NAME:", with: event.name
    fill_in "DATE:", with: event.start_date
    fill_in "TIME:", with: event.start_time
    fill_in "VENUE:", with: event.venue
    find('#users_id').find(:xpath, 'option[1]').click
    find('#users_id').find(:xpath, 'option[2]').click
    click_button "Create Event"
    print page.html
    expect(page).to have_content("Event has been created")
    expect(page).to have_content(user.full_name)
  end
end