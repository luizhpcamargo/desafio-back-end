class EventsController < ApplicationController
  before_action :load_instances, only: :index

  def index; end

  def new; end

  def create
    redirect_to new_event_path if event_params[:file].blank?
    Importer::Cnab.new(event_params[:file]).import!
  end

  private

  def event_params
    params.require(:event).permit(:file)
  end

  def load_instances
    @events = Event.includes(:store).references(:store).all
  end
end
