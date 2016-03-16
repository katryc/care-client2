class Appointment < ActiveRecord::Base
  # validations for secure save
validates :start_time, :end_time, :first_name, :last_name, presence: {message: ":  Please, fill in the fields."}
validates :first_name, :last_name, :uniqueness => { :scope => :start_time }
  #  before filter to ensure capitalization
before_save :capitalize_attributes

def availability
  Appointment.where("start_time > '10:00:00' and end_time < '12:00:00'")

end

before_save :capitalize_attributes

private
   def capitalize_attributes
     self.attributes.select{ |a| ["first_name","last_name"].include? a }.each do |attr, val|
       self.send("#{attr}=", val.try(:strip).try(:capitalize))
     end
   end






end
