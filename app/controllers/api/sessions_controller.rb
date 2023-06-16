class Api::SessionsController < ApplicationController
    def create
        skip_before_action :verify_authenticity_token
        user = User.where(email: params[:email]).first

        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:email]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy

    end  
end
