class StepTypesController < ApplicationController
  # GET /step_types
  # GET /step_types.json
  def index
    @step_types = StepType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @step_types }
    end
  end

  # GET /step_types/1
  # GET /step_types/1.json
  def show
    @step_type = StepType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step_type }
    end
  end

  # GET /step_types/new
  # GET /step_types/new.json
  def new
    @step_type = StepType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step_type }
    end
  end

  # GET /step_types/1/edit
  def edit
    @step_type = StepType.find(params[:id])
  end

  # POST /step_types
  # POST /step_types.json
  def create
    @step_type = StepType.new(params[:step_type])

    respond_to do |format|
      if @step_type.save
        format.html { redirect_to @step_type, notice: 'Step type was successfully created.' }
        format.json { render json: @step_type, status: :created, location: @step_type }
      else
        format.html { render action: "new" }
        format.json { render json: @step_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /step_types/1
  # PUT /step_types/1.json
  def update
    @step_type = StepType.find(params[:id])

    respond_to do |format|
      if @step_type.update_attributes(params[:step_type])
        format.html { redirect_to @step_type, notice: 'Step type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_types/1
  # DELETE /step_types/1.json
  def destroy
    @step_type = StepType.find(params[:id])
    @step_type.destroy

    respond_to do |format|
      format.html { redirect_to step_types_url }
      format.json { head :no_content }
    end
  end
end
