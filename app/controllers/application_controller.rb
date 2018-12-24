class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def render_errors(object)
    render json: { messages: object.errors }, status: 422
  end
end
