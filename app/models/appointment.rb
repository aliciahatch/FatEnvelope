class Appointment < ActiveRecord::Base
  attr_accessible :date, :hour, :student_id, :description, :user_id
  
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
  
  
end
