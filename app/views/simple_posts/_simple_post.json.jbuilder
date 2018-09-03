json.extract! simple_post, :id, :user_id, :text, :pictures, :title, :created_at, :updated_at
json.url simple_post_url(simple_post, format: :json)
