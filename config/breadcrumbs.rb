crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", profile_mypage_index_path
  parent :root
end

crumb :logout do
  link "ログアウト", logout_mypage_index_path
  parent :user
end

