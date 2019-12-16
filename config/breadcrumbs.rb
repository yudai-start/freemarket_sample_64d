crumb :root do
  link "メルカリ ", root_path
end

crumb :items do
  link "@item.name"
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