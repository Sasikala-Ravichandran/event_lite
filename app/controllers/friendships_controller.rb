class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @friendship = Friendship.new(user_id: params[:user], friend_id: params[:friend])
    if @friendship.save
      respond_to do |format|
        format.html do
          flash[:success] = "You sent a request to a friend"
          redirect_to friendship_path(current_user)
        end
        format.js
      end
    else
      flash[:danger] = "You are not allowed to make a friend"
      redirect_to friendship_path(current_user)
    end
  end

  def accept
    @friendship = Friendship.find(params[:id])
    if !@friendship.verified?
      @friendship.toggle(:verified)
      @friendship.save 
      respond_to do |format|
        format.html do 
          flash[:success] = "You accepted the request"
          redirect_to friendship_path(current_user)
        end
        format.js
      end
    else
      flash[:danger] = "You rejected the request"
      redirect_to friendship_path(current_user)
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html do 
        flash[:success] = "You rejected the request"
        redirect_to friendship_path(current_user)
      end
      format.js
    end
  end

  def show
  end

end