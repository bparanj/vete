require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test "doctor name is required" do
    doctor = Doctor.new
    doctor.save
    
    assert_equal ["can't be blank"], doctor.errors[:name]
  end
  
  test "doctor name cannot exceed 35 characters" do
    name = 'n' * 36
    doctor = Doctor.new(name: name)
    doctor.save
    
    assert_equal ["is too long (maximum is 35 characters)"], doctor.errors[:name]
  end
  
  test "doctor with valid name" do
    name = 'n' * 35
    doctor = Doctor.new(name: name)
    doctor.save
    
    assert_equal [], doctor.errors[:name]
  end

  test "doctor zip cannot exceed 5 digits" do
    name = 'n' * 35
    zip = '123456'
    doctor = Doctor.new(name: name, zip: zip)
    doctor.save
    
    assert_equal ["is too long (maximum is 5 digits)"], doctor.errors[:zip]
  end
  
  test "doctor zip is 5 digits" do
    name = 'n' * 35
    zip = '12345'
    doctor = Doctor.new(name: name, zip: zip)
    doctor.save
    
    assert_equal [], doctor.errors[:zip]
  end

  test "doctor experience is between 1-100" do
    name = 'n' * 35
    zip = '12345'
    experience = 10
    doctor = Doctor.new(name: name, zip: zip, experience: experience)
    doctor.save
    
    assert_equal [], doctor.errors[:experience]
  end

  test "doctor experience cannot exceed 100" do
    name = 'n' * 35
    zip = '12345'
    experience = 101
    doctor = Doctor.new(name: name, zip: zip, experience: experience)
    doctor.save
    
    assert_equal ["is not included in the list"], doctor.errors[:experience]
  end
    
end
