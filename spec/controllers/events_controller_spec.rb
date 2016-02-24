require 'rails_helper'
require 'pry'
RSpec.describe EventsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:event) { create(:event, name: "Tech Event", user_id: user) }

  before :each do
    login_with(user)
  end

  describe "GET #index" do
    it "returns index template" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns show template" do
      get :show, id: event.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns new template" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "a successful create" do
      before { post :create, event: FactoryGirl.attributes_for(:event, user_id: user) }
      it "saves an event object in database" do
        expect(Event.count).to eq(1)
      end

      it "displays the flash message" do
        expect(flash[:success]).to eq("Event has been created")
      end

      it "redirects to event show page" do
        expect(response).to redirect_to event_path(Event.last)
      end

    end

    context "an unsuccessful create" do

      before { post :create, event: FactoryGirl.attributes_for(:event, name: " ", user_id: user) }
      it "does not save an event object in database" do
        expect(Event.count).to eq(0)
      end

      it "displays the flash message" do
        expect(flash[:danger]).to eq("Event has not been created")
      end

      it "redirects to event show page" do
        expect(response).to render_template(:new)
      end
    end

  end

  describe "GET #edit" do
     it "returns edit template" do
      allow_any_instance_of(EventsController).to receive(:require_creator)
      get :edit, id: event.id
      expect(response).to have_http_status(:success)
    end

  end

  describe "PUT #update" do

    context "a successful update" do
      before do
        allow_any_instance_of(EventsController).to receive(:require_creator)
        put :update, event: FactoryGirl.attributes_for(:event, name: "Event_is"), id: event.id 
      end

      it "updates an event object in database" do
        expect(event.reload.name).to eq("Event_is")
      end

      it "displays the flash message" do
        expect(flash[:success]).to eq("Event has been updated")
      end

      it "redirects to event show page" do
        expect(response).to redirect_to event_path(event.reload)
      end

    end

    context "an unsuccessful update" do
      before do
        allow_any_instance_of(EventsController).to receive(:require_creator)
        put :update, event: FactoryGirl.attributes_for(:event, name: " "), id: event.id 
      end

      it "updates an event object in database" do
        expect(event.reload.name).to eq("Tech Event")
      end

      it "displays the flash message" do
        expect(flash[:danger]).to eq("Event has not been updated")
      end

      it "redirects to event show page" do
        expect(response).to render_template(:edit)
      end

    end
  end

  describe "DELETE #destroy" do

    before do
      allow_any_instance_of(EventsController).to receive(:require_creator)
      delete :destroy, id: event.id 
    end
    
    it "deletes an event object in the database" do
      expect(Event.count).to eq(0)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("Event has been deleted")
    end

    it "redirects to event show page" do
      expect(response).to redirect_to events_path
    end

  end
end