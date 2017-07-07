class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.maximum_of_name}
  validates :email, presence: true, length: {maximum: Settings.user.maximum_of_email}
  validates :phone, presence: true, length: {maximum: Settings.user.maximum_of_phone}
  validates :password, presence: true, length: {minimum: Settings.user.minimum_of_password}

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
