class UsersController < ApplicationController

  def index
    @users = User.all
    render :json => @users
  end

  def create
    user = User.new(user_params)
    # in Rails 4 you must whitelist attributes with #permit
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @user.save!
    render :json => @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.try :destroy
    render json: { message: "user was destroyed"}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
