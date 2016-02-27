require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  let(:user) { create(:user) }
  let(:friend) { create(:friend) }
  let(:friendship) { create(:friendship) }

  before :each do
    login_with(user)
  end

  describe "POST #create" do

    context "a successful create" do
      before do
        post :create, { user: user.id, friend: friend.id }
      end
      it "saves an friendship object in database" do
        expect(Friendship.count).to eq(1)
        expect(Friendship.last.verified).to eq(false)      
      end

      it "displays the flash message" do
        expect(flash[:success]).to eq("You are send a request to a friend")
      end

      it "redirects_to profile page" do
        expect(response).to redirect_to(user_path(user))
      end

    end

    context "an unsuccessful create" do
      before do
        post :create, friendship: FactoryGirl.attributes_for(:friendship, user: "", friend: friend.id)
      end
      it "does not save an attendance object in database" do
        expect(Friendship.count).to eq(0)       
      end

      it "displays the flash message" do
        expect(flash[:danger]).to eq("You are not allowed to make a friend")
      end

      it "redirects_to profile page" do
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe "POST #accept" do
    before { post :accept, id: friendship.id }
    it "accepts the request" do
      expect(friendship.reload.verified?).to eq(true)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("You accepted the request")
    end

    it "redirects to event show page" do
      expect(response).to redirect_to user
    end
  end

  describe "GET #show" do
    it "returns the show template" do
      get :show, id: friendship.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    before do
      delete :destroy, id: friendship.id 
    end
    
    it "deletes an event object in the database" do
      expect(Friendship.count).to eq(0)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("You rejected the request")
    end

    it "redirects to event show page" do
      expect(response).to redirect_to user
    end
  end
end