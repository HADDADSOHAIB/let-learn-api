module Api
  module V1
    class SignupController < ApplicationController
      def create
        @user = User.new(user_params)
    
        if @user.save
          payload = { user_id: @user.id }
          session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true )
          tokens = session.login
          response.set_cookie(JWTSessions.access_cookie, value: tokens[:access], httponly: true, secure: Rails.env.production? )
          render json: { csrf: tokens[:csrf], auth: tokens[:access] }, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def check_uniqueness
        email = User.find_by(email: params[:email])
        username = User.find_by(username: params[:username])

        render json: { email: !!!email, username: !!!username }
      end

      private

      def user_params
        params.permit(:email, :username, :password, :firstname, :lastname)
      end
    end
  end
end