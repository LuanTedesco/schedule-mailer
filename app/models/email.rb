class Email < ApplicationRecord
  validates :to, presence: true
  validates :mail, presence: true
  validates :body, presence: true

  scope :actives, -> { where(status: true) }
end
