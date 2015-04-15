json.array!(@tempusers) do |tempuser|
  json.extract! tempuser, :id, :pku_id
  json.url tempuser_url(tempuser, format: :json)
end
