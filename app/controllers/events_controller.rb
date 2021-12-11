class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  EVENTS_PER_PAGE = 2;

  # GET /events
  def index
    @page = params.fetch(:page, 0).to_i

    @events = Event.all

    render json: @events.offset(@page * EVENTS_PER_PAGE).limit(EVENTS_PER_PAGE)
  end

  #SEARCH /events/search
  def search
    @events = Event.where("name LIKE ?", "%" + params[:q] + "%")

    render json: @events
  end

  # GET /events/1
  def show
    # @attendees = @event.users
    render json: @event.to_frontend
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    # @event.attach params[:image]

    if @event.save
      @event.image.attach(params[:image]) if params[:image]
      render json: @event.to_frontend, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      @event.image.attach(params[:image]) if params[:image]
      render json: @event.to_frontend
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      byebug
      params.permit(:name, :description, :start, :end, :image)
    end
end
