module CompaniesHelper

  def render_link(param_type, link_val, stored_vals)
    link = "/companies?utf8=%E2%9C%93&q[#{param_type}]=#{link_val}"
  # if the key value is stored in the param type, don't 
  # redundantly include it in the link 

    stored_vals.each do |key, value|
      if key == param_type
        next
      else
        link += "&q[%s]=%s" % [key, value]
      end
    end
    link += "&commit=Search"
    link
  end

  # active style can be overridden with bootstrap

  def render_css(param_type, link_val, stored_vals)
  	stored_vals.each do |key, value|
  		if stored_vals[param_type]==link_val
  			return "background-color:#EFDBCD"
  		end 
   	end 
  end
end
