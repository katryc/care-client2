require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Appointment, type: :model do


    it "is invalid without a first_name"
    it "is invalid without a last_name"
    it "is invalid if start_time and end_time are in the past"
    it "is invalid if shorter than 5 mins"
    it "is invalid if end_time overlap with other.start_time"
end
