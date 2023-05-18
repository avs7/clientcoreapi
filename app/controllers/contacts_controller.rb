class ContactsController < ApplicationController
    before_action :ensure_authorized!
    def index
      @contacts = current_user.contacts
    end

    def show
      @contact = current_user.contacts.find(params[:id])
    end

    def create
      @contact = current_user.contacts.new(contact_params)
      if @contact.save
      else
        render @contact.errors
      end
    end

    def update
      @contact = current_user.contacts.find(params[:id])
      if @contact.update(contact_params)
      else
        render @contact.errors
      end
    end

    def destroy
      @contact = current_user.contacts.find(params[:id])
      @contact.destroy
    end

    private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :dob, :category, :phone, :email, :address, :city, :state, :zip_code)
    end

end
