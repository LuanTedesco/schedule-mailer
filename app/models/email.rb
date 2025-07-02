class Email < ApplicationRecord
  validates :to, presence: true
  validates :subject, presence: true
  validates :body, presence: true
  belongs_to :user

  scope :actives, -> { where(status: true) }
end
