class UsersController < ApplicationController
    def signup
        # debugger
        @user=User.new(user_params)
        if @user.save
            render json: @user, status:201
        else
            render json: @user.errors.full_messages, status:422
        end
    end

    def login
        # debugger
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            user.update(auth_token:SecureRandom.hex)
            render json: user, status:201
        else
            puts "user not found, #{user.inspect}"
            render json: {errors:['invalid email and password']}, status:422
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
    
end
