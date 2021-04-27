json.extract! product, :id, :name, :description, :image_url, :price, :active, :on_sale, :brand_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
