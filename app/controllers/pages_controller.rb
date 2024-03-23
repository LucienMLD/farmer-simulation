class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    authorize :page, :index?
  end
end
