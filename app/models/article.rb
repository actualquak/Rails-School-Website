class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :article_comments, dependent: :destroy
  has_many :comments, as: :commentable
end
