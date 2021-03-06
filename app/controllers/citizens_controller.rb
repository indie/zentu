class CitizensController < ApplicationController
  before_filter :signed_in_citizen, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_citizen,   only: [:edit, :update, :create_charge]
  before_filter :admin_citizen,     only: :destroy
  
  #layout nil
  layout 'panorama', :except => :view
 
  def index
    @citizens = Citizen.paginate(page: params[:page])
  end

  def show
    @citizen = Citizen.find(params[:id])
    @ideas = @citizen.ideas.paginate(page: params[:page])
  end

  def new
  	@citizen = Citizen.new
  end

  def create
    @citizen = Citizen.new(params[:citizen])
    if @citizen.save #saves successfully
      sign_in @citizen
      flash[:success] = "Welcome Global Citizen!"
      redirect_to @citizen
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @citizen = Citizen.find(params[:id])
    if @citizen.update_attributes(params[:citizen])
      flash[:success] = "Updated successfully"
      sign_in @citizen
      redirect_to @citizen
    else
      render 'edit'
    end
  end

  def destroy
    Citizen.find(params[:id]).destroy
    flash[:success] = "Citizen deleted."
    redirect_to citizens_url
  end

  def following
    @title = "Following"
    @citizen = Citizen.find(params[:id])
    @citizens = @citizen.followed_citizens.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @citizen = Citizen.find(params[:id])
    @citizens = @citizen.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def set_approval
    @citizen = Citizen.find params[:id]
    @citizen.update_column :approval, params[:approval]

    render nothing: true
  end

  private

  # removed signed_in_citizen

    def correct_citizen
      @citizen = Citizen.find(params[:id])
      redirect_to(root_path) unless current_citizen?(@citizen)
    end

    def admin_citizen
      redirect_to(root_path) unless current_citizen.admin?
    end

    def authenticate
      deny_access unless sign_in?
    end
end
