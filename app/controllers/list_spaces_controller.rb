class ListSpacesController < ApplicationController
  
  layout "admin"
  # GET /list_spaces
  # GET /list_spaces.json
  def index
    @list_spaces = ListSpace.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_spaces }
    end
  end

  # GET /list_spaces/1
  # GET /list_spaces/1.json
  def show
    @list_space = ListSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_space }
    end
  end

  # GET /list_spaces/new
  # GET /list_spaces/new.json
  def new
    @list_space = ListSpace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_space }
    end
  end

  # GET /list_spaces/1/edit
  def edit
    @list_space = ListSpace.find(params[:id])
  end

  # POST /list_spaces
  # POST /list_spaces.json
  def create
    @list_space = ListSpace.new(params[:list_space])

    respond_to do |format|
      if @list_space.save
        format.html { redirect_to @list_space, notice: 'List space was successfully created.' }
        format.json { render json: @list_space, status: :created, location: @list_space }
      else
        format.html { render action: "new" }
        format.json { render json: @list_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_spaces/1
  # PUT /list_spaces/1.json
  def update
    @list_space = ListSpace.find(params[:id])

    respond_to do |format|
      if @list_space.update_attributes(params[:list_space])
        format.html { redirect_to @list_space, notice: 'List space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_spaces/1
  # DELETE /list_spaces/1.json
  def destroy
    @list_space = ListSpace.find(params[:id])
    @list_space.destroy

    respond_to do |format|
      format.html { redirect_to list_spaces_url }
      format.json { head :no_content }
    end
  end

  protected
  def authorize
    if session[:admin].nil?
    flash[:notice] = "Something went wrong..."
    redirect_to :controller => :gallery, :action => :index

    end
  end
end
