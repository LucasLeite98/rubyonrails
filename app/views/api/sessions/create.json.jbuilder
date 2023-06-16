json.data do
    json.data do
        json.call(
            @user,
            :email,
            :authentication_token 
        )
    end
end