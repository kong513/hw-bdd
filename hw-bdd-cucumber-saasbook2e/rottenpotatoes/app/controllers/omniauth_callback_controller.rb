class OmniauthCallbackController < ApplicationController
    def facebook
        put "Omniauth callback hash: #{auth}"
        redirect_to root_path, notice: "conected: #{auth.info.name}"
    end

    def auth
        request.env['omniauth.auth']
    end
end