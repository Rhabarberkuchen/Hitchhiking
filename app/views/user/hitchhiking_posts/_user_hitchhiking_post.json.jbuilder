json.extract! user_hitchhiking_post, :id, :title, :text, :pictures, :start, :destination, :stops, :time, :created_at, :updated_at
json.url user_hitchhiking_post_url(user_hitchhiking_post, format: :json)
