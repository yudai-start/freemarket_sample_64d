crumb :root do
  link "メルカリ ", root_path
end

crumb :item do |item|
  link item.name
  parent :root
end

crumb :mypage do
  link "マイページ", "/users/#{current_user.id}/edit"
  parent :root
end

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :personal_info do
  link "本人情報の登録", "/addresses/#{current_user.id}/edit"
  parent :mypage
end

crumb :creditCard do
  link "支払い方法", "cards/show"
  parent :mypage
end

crumb :add_payments do
  link "クレジットカード情報入力"
  parent :creditCard
end

