class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  validates :tag, presence: true
  validates :post, presence: true
end
