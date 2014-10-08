class VisitorsController < ApplicationController
  def index
    redirect_to user_dashboard_path if user_signed_in?
  end

end
