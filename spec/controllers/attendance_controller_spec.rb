require 'rails_helper'

RSpec.describe AttendancesController, type: :controller do

  let(:user) { create(:user) }
  let(:event) { create(:event, name: "Tech Event") }
  let(:attendance) { create(:attendance) }

  before :each do
    login_with(user)
  end

  describe "POST #create" do

    context "a successful create" do
      before do
        post :create, { user: user.id, event: event.id }
      end
      it "saves an attendance object in database" do
        expect(Attendance.count).to eq(1)       
      end

      it "displays the flash message" do
        expect(flash[:success]).to eq("You are attending the event")
      end

      it "redirects_to profile page" do
        expect(response).to redirect_to(user_path(user))
      end

    end

    context "an unsuccessful create" do
      before do
        post :create, attendance: FactoryGirl.attributes_for(:attendance, user_id: "", event_id: event.id)
      end
      it "does not save an attendance object in database" do
        expect(Attendance.count).to eq(0)       
      end

      it "displays the flash message" do
        expect(flash[:danger]).to eq("You are not allowed to attend the event")
      end

      it "redirects_to profile page" do
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe "DELETE #destroy" do

    before do
      delete :destroy, id: attendance.id 
    end
    
    it "deletes an event object in the database" do
      expect(Attendance.count).to eq(0)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("You are not attending the event")
    end

    it "redirects to event show page" do
      expect(response).to redirect_to events_path
    end

  end

  describe "POST #accept" do
    before { post :accept, id: attendance.id }
    it "accepts the invitation" do
      expect(attendance.reload.accepted?).to eq(true)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("You are attending the event")
    end

    it "redirects to event show page" do
      expect(response).to redirect_to events_path
    end
  end
end