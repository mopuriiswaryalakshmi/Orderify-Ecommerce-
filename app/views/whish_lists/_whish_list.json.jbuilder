json.extract! whish_list, :id, :user_id, :product_id, :created_at, :updated_at
json.url whish_list_url(whish_list, format: :json)