class Fibonacci < ApplicationRecord
  validates :value, :result, :runtime, presence: true
  validates :value, :result, :runtime, numericality: true
end
