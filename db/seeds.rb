# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if Rails.env == 'development'

# #ユーザデータ

# 80.times do |n|
#   User.create!(
#     email: "test#{n + 1}@test.com",
#     nickname: "テスト太郎#{n + 1}",
#     password: "111aaa"
#   )
# end


#   (1..80).each do |i|
#     Item.create(user_id: "#{i}", name: "Item#{i}", price: "3000", explanation: "商品詳細#{i}")
#   end
# end