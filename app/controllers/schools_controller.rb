class SchoolsController < ApplicationController

  layout nil
  layout 'panorama', :except => :view
  
  def home
    if signed_in?
      @idea = current_citizen.ideas.build 
      @feed_items = current_citizen.personal_feed.paginate(page: params[:page])
    end
      @global_feed = Idea.paginate(:page => params[:page], :per_page => 5)
  end

  def urban
  end

  def zoning
  end

  def deeds
  end

  def lean
  end

  def taxes
  end

  def architecture
  end

  def bookstore
  end

  def alternative
  end
end
