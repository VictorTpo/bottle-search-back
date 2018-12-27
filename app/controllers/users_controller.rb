class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  # POST users/
  def create
    @user = User.new(
      email:    params['email'],
      password: params['password']
    )
    @profile = Profile.new(
      user:       @user,
      full_name:  params['full_name'],
      birthday:   params['birthday']
    )

    if @user.valid? && @profile.valid?
      @user.save
      @profile.save
    else
      render_errors(@user)
    end
  end

  # GET user/me
  def me
    @user = current_user
  end
end
