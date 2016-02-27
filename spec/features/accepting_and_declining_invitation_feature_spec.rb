require 'rails_helper'

RSpec.describe "Accepting an event" do

  let!(:user_1) { create(:user_with_attending_events, count: 3) }
  let!(:user_2) { create(:user_with_attending_events, count: 3) }
  let!(:event_1) { create(:event, creator_id: user_2.id) }
  let!(:attendance_1) { create(:attendance, user_id: user_1.id, 
                                            event_id: event_1.id, accepted: false ) }

  def visit_my_events 
    login_as(user_1)
    visit events_path
  end  

  scenario "user accepts invitation" do
    visit_my_events  
    expect(page).not_to have_css('#attending_list', text: user_1.events.first.name)
    click_link("Accept", match: :first)
    expect(page).to have_css('#attending_list', text: user_1.events.first.name)
  end

  scenario "user declines invitation" do
    visit_my_events
    click_link("Decline", match: :first)
    expect(page).not_to have_content(text: user_1.events.first.name)
  end
end
