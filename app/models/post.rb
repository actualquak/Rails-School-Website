class Post < ApplicationRecord
  belongs_to :User, optional: true
  belongs_to :Category, optional: true
  validates :title, presence: true, length: { minimum: 4, maximum: 128 }
  validates :content, presence: true, length: { minimum: 4, maximum: 512 }
end
