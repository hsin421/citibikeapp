json.array!(@users) do |user|
  json.extract! user, :id, :uname, :pwd, :email
  json.url user_url(user, format: :json)
end
