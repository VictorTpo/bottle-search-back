class ApplicationController < ActionController::API
  def render_errors(object)
    render json: { messages: object.errors }, status: 422
  end
end
