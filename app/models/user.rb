class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  def add_favorite(post)
    # need to create a favorite
    Favorite.create(user_id: id, post_id: post.id)
  #   could write self.id for ^^
  #   but id is sufficient
  end

  # def favorite_posts
  #   # can use Join or Create/Where clauses
  #   # when in doubt, you can always grab info out with where
  #
  #   # post_ids = Favorite.where(user_id: id).pluck(:post_id)
  #   # Post.where(id: post_ids)
  #   posts
  # end
end
