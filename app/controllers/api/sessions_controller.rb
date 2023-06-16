class Api::SessionsController < ApplicationController
    def create
        skip_before_action :verify_authenticity_token
        user = User.where(email: params[:email]).first

        if user&.valid_password?(params[:password])
            # render :create, status: :created
            render json: user.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user&.authentication_token = nil
        if current_user.save
            head(:ok)
        else
            head(:unauthorized)
        end
    end  
end
