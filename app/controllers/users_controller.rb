class UsersController < ApplicationController

  def index
    @users = User.all
    render :json => @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    if @user.save!
      render :json => @user
    else
      render json: @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.try :destroy
    render json: { message: "#{@user.username} was destroyed"}
  end

  def favorites
    render json: Contact.favorite_contacts(params[:id])
  end

  def contact_groups
    render json: ContactGroup.where(:user_id => params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end

end
