class EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_creator, only: [:edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event has been created"
      redirect_to @event
    else
      flash[:danger] = "Event has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Event has been updated"
      redirect_to @event
    else
      flash[:danger] = "Event has not been updated"
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event has been deleted"
    redirect_to events_path
  end

  def search
    @events = Event.search_events(params[:search])
    if @events.blank?
      render status: :not_found, nothing: true #sending 404
    else
      #render json: @events.first
      render partial: 'search'
    end

  end

  private
  def event_params
    params.require(:event).permit(:name, :start_date, :start_time, :venue)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def require_creator
    if current_user != @event.creator
      flash[:danger] = "You are not allowed to do this"
      redirect_to root_path
    end
  end
end