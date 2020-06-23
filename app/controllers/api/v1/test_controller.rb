module Api
  module V1
    class TestController < ApplicationController
      before_action :authorize_access_request!
      def index
        render json: { msg: 'ok'}, status: :ok
      end

      def create
        render json: { msg: 'ok'}, status: :ok
      end 
    end
  end
end
