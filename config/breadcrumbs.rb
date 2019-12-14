crumb :root do
  link "メルカリ ", root_path
end

crumb :items do
  link "@item.name"
  parent :root
end
