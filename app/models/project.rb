class Project < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  validates :name, uniqueness: { scope: "transactions.user_id", message: "Project already exists" }

  scope :achieved, -> {where(achieved: true)}
end
