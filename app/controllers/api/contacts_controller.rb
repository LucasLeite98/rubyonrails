class Api::ContactsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      contacts = Contact.all
      render json: {status: 'SUCCESS', message: 'Loaded contacts', data:contacts}, status: :ok
    end

    def show
      contact = Contact.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded contact', data:contact}, status: :ok
    end

    def create
      contact = Contact.new(post_params)
      if contact.save
        render json: {status: 'SUCCESS', message: 'Saved contact', data:contact}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Contact not saved', data:contact.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      contact = Contact.find(params[:id])
      contact.destroy
      render json: {status: 'SUCCESS', message: 'Deleted contact', data:contact}, status: :ok
    end

    def update
      contact = Contact.find(params[:id])
      if contact.update(contact_params)
        render json: {status: 'SUCCESS', message: 'Updated contact', data:contact}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Contact not updated', data:contact.errors}, status: :unprocessable_entity
      end
    end

    private

    def contact_params
      params.permit(:first_name, :last_name, :email)
    end
end
