class Appointment < ActiveRecord::Base
validates :start_time, :end_time, :first_name, :last_name, presence: {message: ":Please, fill in the fields."}







end
