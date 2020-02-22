class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  #ユーザーがデータベースから削除されてしまった場合にユーザーの投稿も消えるようになる

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  #liked_postsでuserがどの投稿をいいねしているのかを取得できる

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  #ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定する
  
end
