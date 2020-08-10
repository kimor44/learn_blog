class ApplicationController < ActionController::Base
  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
