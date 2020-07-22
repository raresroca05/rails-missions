class FibonacciController < ApplicationController
  protect_from_forgery

  def index
    fibos = Fibonacci.last_ten

    render json: fibos, each_serializer: FibonacciSerializer, status: :ok
  end

  def create
    position = params[:n]

    if position.present?
      result, request_time = FibonacciPositionService.new(position.to_i).call

      create_record(position.to_i, result, request_time)

      render json: {
        value: position,
        result: result,
        runtime: request_time
      }, status: :created
    else
      render json: {
        error: 'Please specify the position of the element you want to retrieve from the sequence!'
      }, status: 400
    end
  end

  private

    def create_record(position, result, request_time)
      Fibonacci.create!(
        value: position,
        result: result,
        runtime: request_time
      )
    end
end
