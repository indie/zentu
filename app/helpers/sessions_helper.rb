module SessionsHelper

  def sign_in(citizen)
    cookies.permanent[:remember_token] = citizen.remember_token
    self.current_citizen = citizen
  end

  def current_citizen=(citizen)
    @current_citizen = citizen
  end

  def current_citizen
    @current_citizen ||= Citizen.find_by_remember_token(cookies[:remember_token])
  end

  def current_citizen?(citizen)
    citizen == current_citizen
  end

  def signed_in?
    !current_citizen.nil?
  end

  def signed_in_citizen
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  end

  def sign_out
    self.current_citizen = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access"
  end

end
