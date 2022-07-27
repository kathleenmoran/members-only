class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
  validates :body, presence: true, length: { in: 1..1000 }

  belongs_to :user
end
