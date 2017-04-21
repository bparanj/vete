json.extract! pet, :id, :name, :breed, :age, :weight, :last_visit, :created_at, :updated_at
json.url pet_url(pet, format: :json)
