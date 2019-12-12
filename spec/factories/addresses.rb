FactoryBot.define do

  factory :address do
    family_name        {"山田"}
    first_name         {"太郎"}
    family_name_kana   {"ヤマダ"}
    first_name_kana    {"タロウ"}
    post_code          {"542-0076"}
    prefecture_id      {"27"}
    city               {"大阪市中央区"}
    street_number      {"5-1-60"}
    building_name      {"なんばスカイオ15階"}
    phone_number       {"000-0000-0000"}
    user_id            {"1"}
  end

end
