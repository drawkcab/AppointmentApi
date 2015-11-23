class Appointment < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :start_time, :end_time

  def check
    if self.start_time.nil? || self.end_time.nil? || self.first_name.nil? || self.last_name.nil?
      return false
    elsif self.start_time.future? && self.end_time.future? && self.start_time < self.end_time
      start = self.start_time.to_time
      finish = self.end_time.to_time
      appt = Appointment.where(start_time: start..finish).first
      if appt.blank?
        appt = Appointment.where(end_time: start..finish).first
        if appt.blank?
          return true
        end
      end
    else
      return false
    end
  end

end
