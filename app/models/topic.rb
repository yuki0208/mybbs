class Topic < ApplicationRecord
  has_many :posts
  default_scope -> { includes(:posts).order('posts.created_at desc') }
  after_create do
    posts.create(name: 'トピ主', body: self.title)
  end	       
end
