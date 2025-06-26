class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true

  enum role: { user: 0, admin: 1, manager: 2, moderator: 3 }

  scope :actives, -> { where(status: true) }
end
