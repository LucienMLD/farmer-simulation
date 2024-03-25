class DashboardsController < ApplicationController

  def index
    authorize :dashboard, :index?
  end
end
