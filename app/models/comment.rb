class Comment < ApplicationRecord
  acts_as_tree order: 'created_at DESC', dependent: :destroy
  validates :content, presence: true, length: { minimum: 4, maximum: 512 }
end
