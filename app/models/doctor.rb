class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5, too_long: 'is too long (maximum is 5 digits)'}
  
  validates_inclusion_of :experience, :in => 1..100
  
end
