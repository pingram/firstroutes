class UsersController < ApplicationController
  def index
    render :json => params
  end

  def create
    # render :text => "posted to create!"
    render :json => params[:name]
  end
end
