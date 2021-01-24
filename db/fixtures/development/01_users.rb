1..50.times do |n|
  User.seed do |s|
    s.id = "#{n + 1}"
    s.nickname = "name-#{n + 1}"
    s.email = "user-#{n + 1}@test.com"
    s.password = 'password'
  end
end

1..50.times do |i|
    Item.seed do |s|
      s.id = "#{i + 1}"
      s.user_id = "#{i + 1}"
      s.name = "商品名#{i + 1}"
      s.explanation = "商品詳細#{i + 1}"
      s.price = 2000
  end
end
