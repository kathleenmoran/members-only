class Post < ApplicationRecord
  validates :title, length: { in: 1..100 }
  validates :body, length: { in: 1..1000 }

  belongs_to :user
end
