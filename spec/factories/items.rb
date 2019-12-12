FactoryBot.define do
  factory :item do
    name         {"メルカリ "}
    user_id      {"2"}
    size         {"M"}
    item_status  {"出品中"}
    shipping_fee_defrayer   {"送料込み"}
    shipping_system {"クロネコヤマト"}
    ship_from_prefecture {"大阪"}
    ship_date {"7日ごろ"}
    price {"7000"}
    description {"ワッペンに少し毛玉あり"}
    buyer_id {"1"}
    status {"やや汚れあり"}
  end
end
