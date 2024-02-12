class Project < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  validates :name, :goal_amount, presence: true

  scope :achieved, -> {where(achieved: true)}
end
