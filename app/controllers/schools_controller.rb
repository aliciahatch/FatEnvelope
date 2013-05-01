class SchoolsController < ApplicationController
  before_filter :authenticate_user!
  # GET /schools
  # GET /schools.json
  def addCompletedStep
  	@school = School.find(params[:id])
  	
  end
  
  
  def index
    @schools = current_user.schools

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/1/edit
  def edit
  	session[:return_to] = request.referer
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(params[:school])
    if(current_user.num_of_tokens - current_user.schools.length > 0)
	    respond_to do |format|
	      if @school.save
		    @schoolid = @school.id
			adder = School.find(@schoolid)
			current_user.schools << adder
	
			
	        format.html { redirect_to root_path, notice: 'School was successfully created.' }
	        format.json { render json: @school, status: :created, location: @school }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @school.errors, status: :unprocessable_entity }
	      end
	   end
    end
    
    
  end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])
    puts "REFERRER: "
  	puts request.referer
  	puts session[:return_to]
    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to session.delete(:return_to), notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  def delete_school_relation
        format.html { redirect_to @school, notice: 'School was successfully updated.' }  	
  end
  
end
