class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def search
    @users = User.search_friend(params[:search_friend])
    if @users
      @users = current_user.except_current_user(@users)
      #render json: @users.first
      puts "sasi #{@users.first}"
      render partial: 'users/search'
    else
      render status: :not_found, nothing: true #sending 404
    end
  end
end