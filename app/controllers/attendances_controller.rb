class AttendancesController < ApplicationController

  before_action :authenticate_user!

  def create
    @attendance = Attendance.new(user_id: params[:user], event_id: params[:event])
    @attendance.accepted = true
    if @attendance.save
      flash[:success] = "You are attending the event"
    else
      flash[:danger] = "You are not allowed to attend the event"
    end
    redirect_to current_user
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
      flash[:success] = "You are attending the event"
    else
      flash[:success] = "You are already attending the event"
    end
    redirect_to events_path
  end

end