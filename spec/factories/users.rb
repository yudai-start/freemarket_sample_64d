FactoryBot.define do
  
  factory :user do
    family_name         {"竹内"}
    first_name          {"暢崇"}
    family_name_kana    {"タケウチ"}
    first_name_kana     {"ノブタカ"}
    nickname            {"nobu"}
    email               {"kkk@gmail.o"}
    password            {"1111aaa"}
    phone_number        {"08011112222"}
    birthday            {"19930312"}
    credit_card_number  {"111122223333"}
    introduction        {"商品説明です"}

  end
end