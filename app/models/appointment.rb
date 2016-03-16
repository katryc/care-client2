class Appointment < ActiveRecord::Base
validates :start_time, :end_time, :first_name, :last_name, presence: {message: ":Please, fill in the fields."}


def availability
  Appointment.where("start_time > '10:00:00' and end_time < '12:00:00'")

end






end
