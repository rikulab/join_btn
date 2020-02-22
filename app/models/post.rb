class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  #liked_usersで投稿が誰にいいねされているのか取得できる
end
