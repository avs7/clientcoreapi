class ContactsController < ApplicationController
    before_action :ensure_authorized!
    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
      else
        render @contact.errors
      end
    end

    def edit
      @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
      else
        render @contact.errors
      end
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
    end

    private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :dob, :category, :phone, :email, :address, :city, :state, :zip_code)
    end

end
