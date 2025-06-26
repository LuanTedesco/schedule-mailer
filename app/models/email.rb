class Email < ApplicationRecord
  validates :to, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  scope :actives, -> { where(status: true) }
end
