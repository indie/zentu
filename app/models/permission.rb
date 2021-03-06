

class Permission < Struct.new(:citizen)

  def allow?(controller, action)
	citizen && citizen.admin?
	controller == "companies" && action == "new"

# => The below block allows the citizen permissions to be specifically delegated to the companies controller

	 if citizen.nil?
	 	controller == "companies" && action.in?(%w[index, show])
	 elsif citizen.admin?
		true
	 else 
		controller == "companies" && action != "destroy"
	   end
    end

=begin
  def initialize(citizen)
  	allow :citizens, [:new, :create]
  	allow :sessions, [:new, :create, :destroy]
  	allow :companies, [:index, :show]
  	if citizen
  	  allow :citizens [:edit, :update]
  	  allow :companies [:new, :create, :edit, :update]
  	  allow_all if citizen.admin?
  	end
  end

  def allow?(controller, action)
  	@allow_all || @allowed_actions[[controller.to_s, action.to_s]]
  end 	

  def allow_all
  	@allow_all = true
  end

  def allow(controllers, actions)
  	@allowed_actions ||= {}
  	Array(controllers).each do |controller|
  	  Array(action).each do |action|
  	  	@allowed_actions[[controller.to_s, action.to_s]] = true
  	  end
  	end
  end
=end

end

