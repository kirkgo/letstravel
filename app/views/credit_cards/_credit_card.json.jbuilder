json.extract! credit_card, :id, :user_id, :cardholder, :number, :expire_date, :cvv, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
