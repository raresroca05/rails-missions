class Fibonacci < ApplicationRecord
  validates :value, :result, :runtime, presence: true
  validates :value, :result, :runtime, numericality: true

  scope :last_ten, -> { order(created_at: :desc).take(10) }
end
