class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {maximum: Settings.post.maximum_of_title}
  validates :content, presence: true, length: {maximum: Settings.post.maximum_of_content}
  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.post.maximum_of_size_picture.megabytes
    errors.add :picture, t(".should_be_less_than_5MB")
  end
end
