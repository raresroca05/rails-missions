class FibonacciPositionService
  attr_reader :position, :start_time

  def initialize(position)
    @position = position
    @start_time = Time.now
  end

  def call
    raise 'Please specify the position of the element you want to retrieve from the sequence!' if position.blank?

    return fibonacci_sequence, request_time
  end

  private

    def fibonacci_sequence
      x = 0
      y = 1

      position.times do
        temp = x
        x = y
        y = temp + y
      end

      x
    end

    def request_time
      1000 * (Time.now.to_f - start_time.to_f)
    end
end
