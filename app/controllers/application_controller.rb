class ApplicationController < ActionController::Base
  
  include SessionsHelper
  protect_from_forgery

  delegate :allow?, to: :current_permission
  helper_method :allow?

  def handle_unverified_request
    super
  end

private

#  def current_citizen
#  	@current_citizen ||= Citizen.find(session[:citizen_id]) if session[:citizen_id]
#  end
#  helper_method :current_citizen

  def current_permission 
    @current_permission ||= Permission.new(current_citizen)
  end

  def authorize 
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to root_url, alert: "Not authorized"
    end 
  end  

end
