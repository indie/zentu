class NodesController < ApplicationController
  before_filter :find_node, only: [:show, :edit, :update, :destroy]

  layout nil
  layout 'nddsp', :except => :view


  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.order(:id)
    respond_to do |format|
      format.html
      format.csv { send_data @nodes.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @node = Node.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])

    respond_to do |format|

      if @node.save
        format.html { redirect_to @node, notice: 'Node category successfully created.' }
        format.json { render json: @node, status: :created, location: @node }
      else
        format.html { render action: "new" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Node category successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy

    respond_to do |format|
      format.html { redirect_to nodes_url }
      format.json { head :no_content }
    end
  end

  def import
    Node.import(params[:file])
    redirect_to nodes_path, notice: "Categories imported."
  end

  private

  def find_node
    @node = Node.find_by_slug!(params[:id])
  end

end
