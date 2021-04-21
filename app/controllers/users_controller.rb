class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      token = Knock::AuthToken.new(payload: { sub: @user.id }).token
      render json: {
        jwt: token
      }, status: 201
    else
      puts @user.errors.messages
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      token = Knock::AuthToken.new(payload: { sub: @user.id }).token
      render json: {
        email: @user.email,
        jwt: token
      }, status: 200
    else
      render json: {error: "Incorrect email or password"}, status: 401
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
