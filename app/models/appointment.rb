class Appointment < ActiveRecord::Base
  # validations for secure save method execution
validates :start_time, :end_time, :first_name, :last_name, presence: {message: ":  Please, fill in the fields."}
validates :first_name, :last_name, :uniqueness => { :scope => :start_time }
  #executed on creation of the record to ensure the appropriate date format and appointment duration
validate :is_future, on: :create
validate :long_enough, on: :create
  #  before filter to ensure capitalization
before_save :capitalize_attributes


#initialize csv_export
def self.to_csv
    attributes = %w{start_time end_time first_name last_name comments}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |appointment|
        csv << attributes.map{ |attr| appointment.send(attr) }
      end
    end
  end

#custom validation for the dates to be in the futute only
def past?
   start_time && end_time < Date.today
end
# validate the future origin of the date
def is_future
   errors.add("appointment time", "cannot be in the past") if start_time && past?
end


#custom validation for ensuring the appointment is not shorter tan 5 minutes
def short_appointment
   end_time - start_time < 5.minutes
end

def long_enough
    errors.add("appointment time", "cannot be less than 5 mins long") if short_appointment
end


# custom method for capitalization of names in the record

private
   def capitalize_attributes
     self.attributes.select{ |a| ["first_name","last_name"].include? a }.each do |attr, val|
       self.send("#{attr}=", val.try(:strip).try(:capitalize))
     end
   end


end
