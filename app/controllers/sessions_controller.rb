class SessionsController < ApplicationController

  layout nil
  layout 'panorama', :except => :view

  def new
  end

  def create
    citizen = Citizen.find_by_email(params[:session][:email].downcase)
    if citizen && citizen.authenticate(params[:session][:password])
      sign_in citizen
      redirect_to home_path
    else
      flash.now[:error] = 'Sign-in information not valid. Please try again' 
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end