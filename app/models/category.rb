class Category < ApplicationRecord
  has_many :Posts, dependent: :destroy
end
