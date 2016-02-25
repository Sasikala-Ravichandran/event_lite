require 'rails_helper'

RSpec.describe AttendancesController, type: :controller do

  describe "GET #index" do
    it "returns index template" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns new template" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end