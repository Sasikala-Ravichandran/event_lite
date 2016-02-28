class AttendancesController < ApplicationController

  before_action :authenticate_user!

  def create
    @attendance = Attendance.new(user_id: params[:user], event_id: params[:event])
    @attendance.accepted = true
    if @attendance.save
      respond_to do |format|
        format.html do 
          redirect_to current_user
          flash[:success] = "You are attending the event"
        end
        format.js
      end
    else
      flash[:danger] = "You are not allowed to attend the event"
      redirect_to current_user
    end
  end
  
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    flash[:success] = "You are not attending the event"
    redirect_to events_path
  end

  def accept
    @attendance = Attendance.find(params[:id])
    if !@attendance.accepted?
      @attendance.toggle(:accepted)
      @attendance.save 
      respond_to do |format|
        format.html do 
          redirect_to events_path
          flash[:success] = "You are attending the event"
        end
        format.js
      end
    else
      flash[:danger] = "You are already attending the event"
      redirect_to events_path
    end
  end

end