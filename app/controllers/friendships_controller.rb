class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @friendship = Friendship.new(user_id: params[:user], friend_id: params[:friend])
    if @friendship.save
      flash[:success] = "You are send a request to a friend"
    else
      flash[:danger] = "You are not allowed to make a friend"
    end
    redirect_to current_user
  end

  def accept
    @friendship = Friendship.find(params[:id])
    if !@friendship.verified?
      @friendship.toggle(:verified)
      @friendship.save 
      flash[:success] = "You accepted the request"
    else
      flash[:danger] = "You rejected the request"
    end
    redirect_to current_user
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:success] = "You rejected the request"
    redirect_to current_user
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

end