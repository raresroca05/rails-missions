class FibonacciController < ApplicationController
  protect_from_forgery

  def create
    position = params[:n]

    if position.present?
      result, request_time = FibonacciPositionService.new(position.to_i).call

      render json: {
        value: position,
        result: result,
        runtime: request_time
      }
    else
      render json: {
        error: 'Please specify the position of the element you want to retrieve from the sequence!'
      }, status: 400
    end
  end
end
