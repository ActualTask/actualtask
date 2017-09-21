json.extract! review, :id, :title, :user_id, :content, :rating, :task_id, :created_at, :updated_at
json.url review_url(review, format: :json)
