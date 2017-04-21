class Pet < ApplicationRecord
   CATEGORY = ["Dog", "Cat", "Bird"]
   
   validates :name, presence: true
   validates :age, presence: true
   validates :weight, presence: true
   validates :last_visit, presence: true
   
   validates :breed, presence: true
   validates :breed, length: { maximum: 35 }
end

