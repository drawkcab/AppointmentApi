class Appointment < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :start_time, :end_time

  def check
    if self.start_time.nil? || self.end_time.nil? || self.first_name.nil? || self.last_name.nil?
      return false
    elsif self.start_time.future? && self.end_time.future?
      return true
    else
      return false
    end
  end

end
