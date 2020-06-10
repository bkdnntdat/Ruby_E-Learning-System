json.extract! user, :id, :username, :password, :firstName, :lastName, :dateOfBirth, :created_at, :updated_at
json.url user_url(user, format: :json)
