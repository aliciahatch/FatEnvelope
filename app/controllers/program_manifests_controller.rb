class ProgramManifestsController < ApplicationController
  # GET /program_manifests
  # GET /program_manifests.json
  def index
    @program_manifests = ProgramManifest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @program_manifests }
    end
  end

  # GET /program_manifests/1
  # GET /program_manifests/1.json
  def show
    @program_manifest = ProgramManifest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program_manifest }
    end
  end

  # GET /program_manifests/new
  # GET /program_manifests/new.json
  def new
    @program_manifest = ProgramManifest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program_manifest }
    end
  end

  # GET /program_manifests/1/edit
  def edit
    @program_manifest = ProgramManifest.find(params[:id])
  end

  # POST /program_manifests
  # POST /program_manifests.json
  def create
    @program_manifest = ProgramManifest.new(params[:program_manifest])

    respond_to do |format|
      if @program_manifest.save
        format.html { redirect_to @program_manifest, notice: 'Program manifest was successfully created.' }
        format.json { render json: @program_manifest, status: :created, location: @program_manifest }
      else
        format.html { render action: "new" }
        format.json { render json: @program_manifest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /program_manifests/1
  # PUT /program_manifests/1.json
  def update
    @program_manifest = ProgramManifest.find(params[:id])

    respond_to do |format|
      if @program_manifest.update_attributes(params[:program_manifest])
        format.html { redirect_to @program_manifest, notice: 'Program manifest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @program_manifest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_manifests/1
  # DELETE /program_manifests/1.json
  def destroy
    @program_manifest = ProgramManifest.find(params[:id])
    @program_manifest.destroy

    respond_to do |format|
      format.html { redirect_to program_manifests_url }
      format.json { head :no_content }
    end
  end
end
