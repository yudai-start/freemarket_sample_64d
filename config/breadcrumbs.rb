crumb :root do
  link "メルカリ ", root_path
end

crumb :item do |item|
  link item.name
  parent :root
end

crumb :mypage do
  link "マイページ", mypage_users_path
  parent :root
end

crumb :profile do |user|
  link "プロフィール"
  parent :mypage
end

crumb :logout do
  link "ログアウト", signout_users_path
  parent :mypage
end

crumb :personal_info do
  link "本人情報の登録", edit_address_path
  parent :mypage
end

crumb :creditCard do
  link "支払い方法", "cards/registration"
  parent :mypage
end

crumb :add_payments do
  link "クレジットカード情報入力"
  parent :creditCard
end

