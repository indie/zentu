class IdeasController < ApplicationController
  before_filter :signed_in_citizen, only: [:create, :destroy]
  before_filter :correct_citizen, only: :destroy
  
  layout nil
  layout 'panorama', :except => :view

# DO NOT USE WILL BREAK TAGS
# layout "usedtobreaktagsbutfixednow"
# DO NOT USE WILL BREAK TAGS

def index
    if params[:tag]
      @global_feed = Idea.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 8)
    else
      # @global_feed = Idea.all
      @global_feed = Idea.paginate(:page => params[:page], :per_page => 8)
    end
  end

  def feed
  end


  def create
  	@idea = current_citizen.ideas.build(params[:idea])
    if @idea.save
      flash[:success] = "Contribution added successfully"
      redirect_to root_url
    else
      @feed_items = []
      render 'schools/home'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @title = "Edit" 
  end

  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to root_url, notice: 'Contribution successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Contribution deleted'}
      format.json { head :no_content }
    end
  end

   private

    def correct_citizen
      @idea = current_citizen.ideas.find_by_id(params[:id])
      redirect_to root_url if @idea.nil?
    end
end
