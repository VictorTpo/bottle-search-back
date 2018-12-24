class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  # POST users/
  def create
    @user = User.new(
      email: params['email'],
      password: params['password']
    )
    if @user.valid?
      @user.save
    else
      render_errors(@user)
    end
  end
end
