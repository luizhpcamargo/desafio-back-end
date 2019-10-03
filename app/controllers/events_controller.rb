class EventsController < ApplicationController
  before_action :load_instances

  def index; end

  private

  def load_instances
    @events = Event.includes(:store).references(:store).all
  end
end
