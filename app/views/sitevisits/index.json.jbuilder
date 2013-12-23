json.array!(@sitevisits) do |sitevisit|
  json.extract! sitevisit, :id, :ip, :ua
  json.url sitevisit_url(sitevisit, format: :json)
end
