class BootcampsController < ApplicationController
  before_filter :can_manage_bootcamps?
  # GET /bootcamps
  # GET /bootcamps.json
  def index
    @bootcamps = Bootcamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bootcamps }
    end
  end

  # GET /bootcamps/1
  # GET /bootcamps/1.json
  def show
    redirect_to 'index'
  end

  # GET /bootcamps/new
  # GET /bootcamps/new.json
  def new
    @bootcamp = Bootcamp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bootcamp }
    end
  end

  # GET /bootcamps/1/edit
  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  # POST /bootcamps
  # POST /bootcamps.json
  def create
    @bootcamp = Bootcamp.new(params[:bootcamp])

    respond_to do |format|
      if @bootcamp.save
        format.html { redirect_to bootcamps_url, notice: 'Bootcamp was successfully created.' }
        format.json { render json: @bootcamp, status: :created, location: @bootcamp }
      else
        format.html { render action: "new" }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bootcamps/1
  # PUT /bootcamps/1.json
  def update
    @bootcamp = Bootcamp.find(params[:id])

    respond_to do |format|
      if @bootcamp.update_attributes(params[:bootcamp])
        format.html { redirect_to bootcamps_url, notice: 'Bootcamp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bootcamps/1
  # DELETE /bootcamps/1.json
  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy

    respond_to do |format|
      format.html { redirect_to bootcamps_url }
      format.json { head :no_content }
    end
  end
  
  def can_manage_bootcamps?
    authorize! :manage_bootcamps, :all
  end
  
end
