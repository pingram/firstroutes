class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render :json => @contacts
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render :json => @contact
    else
      render :json => @contact.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render :json => @contact
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(contact_params)

    if @contact.save!
      render :json => @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.try :destroy
    render json: { message: "#{@contact.id} was destroyed"}
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
