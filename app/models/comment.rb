class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: {maximum: Settings.comment.maximum_of_content}
end
