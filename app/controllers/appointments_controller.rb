class AppointmentsController < ApplicationController
  
  def index
    if params[:user_id] and (params[:user_id].to_i == current_user.id or current_user.has_role? :admin)
      @user = User.find(params[:user_id])
      if @user.has_role? :teacher or @user.has_role? :student
        @date = params[:date] || (Time.now.to_date + 1.day)
        @date = @date.to_date
        @appointment = nil
        if @user.has_role? :teacher
          render 'index_teacher'
          return false
        else
          @registration = Registration.where(['bootcamp_date is not NULL']).where(:user_id => @user.id).order('bootcamp_date DESC').first
          if @registration and @date > Date.new(Time.now.year,Time.now.month,Time.now.day)
            @date = @registration.bootcamp_date
            if @date > Date.new(Time.now.year,Time.now.month,Time.now.day)
              @appointment = Appointment.where(:date => @date,:student_id => @user.id).first
              render 'index'
              return false
            else
              flash[:error] = "The student has not registered to a bootcamp in the future."
            end
          else
            if @date <= Date.new(Time.now.year,Time.now.month,Time.now.day)
              flash[:error] = "The date must be after today."
            else
              flash[:error] = "The student is not registered at a bootcamp."
            end
          end
        end
      else
        #raise error: only students can schedule an appointment
        flash[:error] = "only students can schedule an appointment."
      end
    else
      #raise error: students can only schedule appointment for themselves
      flash[:error] = "Students can only schedule appointment for themselves."
    end
    if current_user.has_role? :admin
      redirect_to(:controller => 'users', :action => 'index')
    else
      redirect_to(:controller => 'users', :action => 'dashboard')
    end
  end
  
  def book
    if params[:date] and params[:hour] and params[:user_id]
      if params[:user_id] and (params[:user_id] == current_user.id or current_user.has_role? :admin)
        @user = User.find(params[:user_id])
        @date = params[:date].to_date
        if @user.has_role? :student and @date > Date.new(Time.now.year,Time.now.month,Time.now.day)
          @registration = Registration.where(:bootcamp_date => @date).where(:user_id => @user.id).first
          if @registration
            @appointment = Appointment.where(:date => @date, :student_id => @user.id).first
            if @appointment
              @appointment.destroy
            end
            @appointment = Appointment.new(:description => 'session', :student_id => @user.id)
            @appointment.date = Date.new(@date.year, @date.month, @date.day)
            @appointment.hour = params[:hour].to_i
            @appointment.user_id = Appointment.available_teacher(@appointment.date, @appointment.hour) 
            if @appointment.save
              flash[:notice] = "Appointment Successfully Saved."
            else
              flash[:error] = "Appointment Not Saved."
            end
            redirect_to :back
            return false
          else
            #raise error: user not registered
            flash[:error] = "The student is not registered for that bootcamp."
          end
        else
          #raise error: only students can schedule an appointment
          if @date <= Date.new(Time.now.year,Time.now.month,Time.now.day)
            flash[:error] = "The date must be after today."
          else
            flash[:error] = "Only students can schedule an appointment."
          end
        end
      else
        #raise error: students can only schedule appointment for themselves
        flash[:error] = "Students can only schedule appointment for themselves."
      end
    else
      #raise error: students can only schedule appointment for themselves
      flash[:error] = "Students can only schedule appointment for themselves."
    end
    redirect_to(:controller => 'users', :action => 'dashboard')
  end
  
  def make_available
    if params[:date] and params[:hour] and params[:user_id]
      if params[:user_id] and (params[:user_id] == current_user.id or current_user.has_role? :admin)
        @appointment = Appointment.where(:date => params[:date].to_date, :hour => params[:hour], :user_id => params[:user_id]).first
        @appointment.destroy
        respond_to do |format|
          format.json  {render :json => { :status => 'success'}.to_json}
        end
      else
        #raise error: students can only schedule appointment for themselves
      end
    else
      #raise error: students can only schedule appointment for themselves
    end
  end
  
  def make_unavailable
    if params[:date] and params[:hour] and params[:user_id]
      if params[:user_id] and (params[:user_id] == current_user.id or current_user.has_role? :admin)
        @appointment = Appointment.create(:date => params[:date].to_date, :hour => params[:hour], :user_id => params[:user_id], :description => 'unavailable')
        respond_to do |format|
          format.json  {render :json => { :status => 'success'}.to_json}
        end
      else
        #raise error: students can only schedule appointment for themselves
      end
    else
      #raise error: students can only schedule appointment for themselves
    end
  end
  
  def all
    @teachers = User.teachers
    @date = params[:date] || (Time.now.to_date + 1.day)
    @date = @date.to_date
  end
  
  
  def index_OLD
    if params[:user_id] and (params[:user_id] == current_user.id or current_user.has_role? :admin)
      @user = User.find(params[:user_id])
      if @user.has_role? :teacher or @user.has_role? :student
        @date = Time.now.to_date
        @appointment = nil
        if @user.has_role? :teacher
          @appointment = Appointment.where(:user_id => @user_id)
        else
          @registration = Registration.where(['bootcamp_date is not NULL']).where(:user_id => @user.id).order('bootcamp_date DESC').first
          if @registration
            @date = @registration.bootcamp_date
            @appointment = Appointment.where(:student_id => @user_id)
          else
            
          end
        end
      else
        #raise error: only students and teachers can schedule an appointment
      end
    else
      #raise error: students can only schedule appointment for themselves
    end
  end
  
  
end
