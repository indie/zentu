class SupplementalsController < ApplicationController
  # GET /supplementals
  # GET /supplementals.json
  def index
    @supplementals = Supplemental.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplementals }
    end
  end

  # GET /supplementals/1
  # GET /supplementals/1.json
  def show
    @supplemental = Supplemental.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplemental }
    end
  end

  # GET /supplementals/new
  # GET /supplementals/new.json
  def new
    @supplemental = Supplemental.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplemental }
    end
  end

  # GET /supplementals/1/edit
  def edit
    @supplemental = Supplemental.find(params[:id])
  end

  # POST /supplementals
  # POST /supplementals.json
  def create
    @supplemental = Supplemental.new(params[:supplemental])

    respond_to do |format|
      if @supplemental.save
        format.html { redirect_to @supplemental, notice: 'Supplemental was successfully created.' }
        format.json { render json: @supplemental, status: :created, location: @supplemental }
      else
        format.html { render action: "new" }
        format.json { render json: @supplemental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplementals/1
  # PUT /supplementals/1.json
  def update
    @supplemental = Supplemental.find(params[:id])

    respond_to do |format|
      if @supplemental.update_attributes(params[:supplemental])
        format.html { redirect_to @supplemental, notice: 'Supplemental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplemental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplementals/1
  # DELETE /supplementals/1.json
  def destroy
    @supplemental = Supplemental.find(params[:id])
    @supplemental.destroy

    respond_to do |format|
      format.html { redirect_to supplementals_url }
      format.json { head :no_content }
    end
  end
end
