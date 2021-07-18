class Post < ApplicationRecord
  belongs_to :User, optional: true
  belongs_to :Category, optional: true
end
