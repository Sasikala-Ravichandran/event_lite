require 'rails_helper'

RSpec.feature "Searching events" do
  
  let!(:event) { create(:event, name: "Women who code") }
  let!(:user) { create(:user) }

  def visit_my_page 
    login_as(user)
    visit root_path
    click_link "My Page"
  end

  scenario "exists with database" do
    visit_my_page
    fill_in "search", with: "who"
    click_button "Look up a event"
    expect(page).to have_content(event.name)
  end

  scenario "does not exists with database" do
    visit_my_page
    fill_in "search", with: "rainbow"
    click_button "Look up a event"
    expect(page.status_code).to eq(404)
  end

end