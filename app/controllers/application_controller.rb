class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    # before_action :authentication_user

    private

    # def authentication_user
    #     auth_token=request.headers['Authorization']
    #     @current_user=User.find_by(auth_token: auth_token)

    #     render json: {errors:['unauthorizes']}, status:422 unless @current_user
    # end
end
