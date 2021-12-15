class Api::V1::UsersController < Api::V1::ApplicationController
    before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @existing = User.exists?(email: params[:email])

    if @existing
      render json: { error: "User already exists" }
    else
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: { user: @user, token: token }, status: :created
      else
        render json: { error: "Invalid registration parameters" }
      end
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:firstname, :lastname, :email, :password)
  end

end
