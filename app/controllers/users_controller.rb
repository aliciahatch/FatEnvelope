class UsersController < ApplicationController
  
  require 'open-uri'
  require 'json'
  
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
  end
  
  def new
    authorize! :manage_users, :all
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    authorize! :manage_users, :all
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    authorize! :manage_users, :all
    @user = User.new(params[:user])
    if @user.role == 'admin' or @user.role == 'teacher'
      @user.validation_scenario = 'admin_or_teacher'
    end
    respond_to do |format|
      if @user.save
        @user.add_role @user.role
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    authorize! :manage_users, :all
    @user = User.find(params[:id])
    if @user.has_role? :admin or @user.has_role? :teacher
      @user.validation_scenario = 'admin_or_teacher'
    end
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def dashboard
    #authorize! :student_actions, :all
    @user = current_user
  end
  
  def bootcamp_welcome
    
  end

  def panam_login
json_object=JSON.parse(open("https://panameducation.com/app/sso/token?api_login="+ENV['panam_api_login']+"&api_password="+ENV['panam_api_password']+"&email="+current_user.email).read)
  puts "HOLA!!!!!!!!!!!!!!!"
  if json_object['result']
    puts json_object['result']['token']
  end
  puts "END!!!!!!!!!!!!!!"
  end
  
end
