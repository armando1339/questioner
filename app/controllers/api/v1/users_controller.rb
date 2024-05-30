module Api
  module V1
    class UsersController < ApplicationController

      def create
        user = User.new(users_params)

        if user.save
          render(json: { message: "OK" }, status: :ok)
        else
          render(
            json: { errors: user.errors.full_messages },
            status: :unprocessable_entity
          ) 
        end
      end

      # I am going to create a rustic authentication in order
      # to not add any gem for authentication
      def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = log_in(user)

          render(
            json: { token: token, message: "OK"},
            status: :ok
          )
        else
          render(
            json: { message: 'Could not confirm credentials' },
            status: :unprocessable_entity
          )
        end
      end

      def logout
        user = User.find_by(jwt: get_token_from_headers)

        if user.present?
          user.jwt = nil
          user.save

          render(json: { message: "signed out successfully" }, status: :ok)
        else
          render(
            json: { message: "Invalid token" },
            status: :unprocessable_entity
          ) 
        end
      end

      private

      def users_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
