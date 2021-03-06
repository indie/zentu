class CompaniesController < ApplicationController
 before_filter :authorize, only: [:create, :new, :edit, :destroy]
 before_filter :signed_in_citizen, only: [:create, :edit, :destroy]
 #before_filter :correct_citizen, only: [:create, :edit, :destroy]


  layout nil
  layout 'panorama', :except => :view


  # GET /companies
  # GET /companies.json
  def index
    if not session[:company_params] 
      session[:company_params] = {}
    end
    
    @company_params = session[:company_params]
    if params[:q]
      @first = true 
      (params[:q]).each do |key, value|
        if @first == true and session[:company_params][key] == value
          session[:company_params].delete(key) 
          params[:q].delete(key)
        else  
          session[:company_params][key]=value
        end
        @first = false 
      end

      if params[:q].include? :category_or_city_cont
          # session.delete(:meeting_params)
          (session[:company_params]).each do | key, value | 
            session[:company_params].delete key
          end
       end   
    end

    @extra_q = session[:company_params]
    @q = Company.search(params[:q])

  
    # @companies = Company.all
    @search = Company.search(params[:q])
    @companies = @search.result.order('id desc')

    @param_data = {
      "category_cont" => {
        'Scrap Metal Recycling' => 'Metal',
        'Reuse Materials' => 'Reuse',
        'Land Survey' => 'Surv',
        'Architecture + Planning' => 'Arch', 
        'General Contractor' => 'Contractor',
        'General Labor' => 'Labor',
        'Sheetrock + Drywall Finishing' => 'Drywall',
        'Concrete + Foundations' => 'Concrete',
        'Deconstruction' => 'Deconstruct',
        'Drainage + Sewer' => 'Drainage',
        'Roofing + Siding' => 'Roof',
        'Electrician' => 'Electrician',
        'Fences + Decking' => 'Fences',
        'Woodworking + Carpentry' => 'Carpen',
        'Plumbing' => 'Plumb',
        'Roofing' => 'Roof',
        'Landscaping + Pruning' => 'Landscap',
        'Prefab Specialist' => 'Prefab',
        'Home Inspection' => 'Inspect',
        'Other Specialist' => 'Other',
        'Welding' => 'Weld'},

      "city_cont" => {
         'Aurora' => 'Aurora',
         'Aloha' => 'Aloh',
         'Bend' => 'Bend',
         'Banks' => 'Banks',
         'Beavercreek' => 'Beavercreek', 
         'Beaverton' => 'Beavert', 
         'Canby' => 'Canby',
         'Clackamas' => 'Clack', 
         'Colton' => 'Colton', 
         'Corbett' => 'Corb', 
         'Cornelius' => 'Corneli', 
         'Deer Island' => 'Deer', 
         'Dundee' => 'Dundee',
         'Estacada' => 'Estac',
         'Forest Grove' => 'Forest Grove', 
         'Gladstone' => 'Glad', 
         'Government Camp' => 'Gov', 
         'Gresham' => 'Gresh', 
         'Hillsboro' => 'Hillsb', 
         'Hubbard' => 'Hubb',
         'King City' => 'King', 
         'Lake Oswego' => 'Osw',
         'Longview WA' => 'Longview', 
         'Milwaukie' => 'Milwa',
         'Molalla' => 'Mola',
         'Newberg' => 'Newb',
         'North Plains' => 'Plains',
         'Oregon City' => 'Oregon City',
         'NW Portland' => 'NW Po',
         'SW Portland' => 'SW Po',
         'NE Portland' => 'NE Po',
         'SE Portland' => 'SE Po',
         'Sandy' => 'Sandy',
         'Scappoose' => 'Scap',
         'Sherwood' => 'Sherw',
         'St Benedict' => 'Bened',
         'St Helens' => 'Helens',
         'Tigard' => 'Tigard',
         'Troutdale' => 'Trout',
         'Tualitin' => 'Tual',
         'Vancouver WA' => 'Vanc',
         'Vernonia' => 'Verno',
         'Welches' => 'Welch',
         'West Linn' => 'Linn',
         'Wilsonville' => 'ilso',
         'Woodburn' => 'Woodb'}    
      } 


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    # if current_citizen.can_add_company
      @company = Company.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @company }
      #end
      #else
      #  redirect_to new_charge_path
     end

    end


  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create

    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        current_citizen.update_attribute :can_add_company, false
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def clear_options
      # session.delete(:meeting_params)
      (session[:company_params]).each do | key, value | 
        session[:company_params].delete key
      end
      redirect_to companies_path
  end
  
  def import 
      Company.import(params[:file])
      redirect_to companies_path, notice: "Companies imported successfully"
  end
# private 
end
