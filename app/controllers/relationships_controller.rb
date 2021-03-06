class RelationshipsController < ApplicationController
  before_filter :signed_in_citizen

  def create
    @citizen = Citizen.find(params[:relationship][:followed_id])
    current_citizen.follow!(@citizen)
    respond_to do |format|
      format.html { redirect_to @citizen }
      format.js
    end
  end

  def destroy
    @citizen = Relationship.find(params[:id]).followed
    current_citizen.unfollow!(@citizen)
    respond_to do |format|
      format.html { redirect_to @citizen }
      format.js
    end
  end
end