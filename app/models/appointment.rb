class Appointment < ActiveRecord::Base
  attr_accessible :date, :hour, :student_id, :description, :user_id
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
  
  validates :date, :hour, :description, :user_id, :presence => true
  validates :date, :format => { :with => /\d\d\d\d-\d\d-\d\d/, :message => "invalid format, must match: YYYY-MM-DD" }
  
  def self.availability(date, hour)
    teachers = User.teachers.count
    appointments = Appointment.where(:date => date, :hour => hour).count
    return teachers > appointments ? true : false
  end
  
  def self.teacher_availability(user, date, hour)
    appointment = Appointment.where(:user_id => user.id, :date => date, :hour => hour).first
    return appointment ? appointment.description : false
  end
  
  def self.available_teacher(date, hour)
    User.teachers.each do |teacher|
      appointment = Appointment.where(:user_id => teacher.id, :date => date, :hour => hour).first
      unless appointment
        return teacher.id
      end
    end
    return nil
  end
  
  def date_formatted
    self.date.strftime("%m/%d/%Y")
  end
  
  def self.am_pm_hour(hour)
    hour <= 12 ? "#{hour}:00 am" : "#{hour - 12}:00 pm"
  end
  
  
end
