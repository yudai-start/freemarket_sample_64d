json.array! @result_items do |item|
  json.id item.id
  json.name item.name
  json.user_id item.user_id
  json.size item.size
  json.item_status_id item.item_status_id
  json.shipping_fee_defrayer_id item.shipping_fee_defrayer_id
  json.shipping_system item.shipping_system
  json.ship_from_prefecture item.ship_from_prefecture
  json.ship_date_id item.ship_date_id
  json.price item.price
  json.description item.description
  json.buyer_id item.buyer_id
  json.status item.status
  json.created_at item.created_at
  json.updated_at item.updated_at
end