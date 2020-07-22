class FibonacciSerializer < ActiveModel::Serializer
  attributes :value, :result, :runtime, :created_at
end
