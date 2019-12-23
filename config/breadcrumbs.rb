crumb :root do
  link "メルカリ ", root_path
end

crumb :item do |item|
  link item.name
  parent :root
end

crumb :mypage do
  link "マイページ", "/posts/mypage"
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
  link "本人情報の登録", "/posts/personal_info"
  parent :mypage
end

crumb :creditCard do
  link "支払い方法", "/posts/creditCard"
  parent :mypage
end

crumb :add_payments do
  link "クレジットカード情報入力"
  parent :creditCard
end

