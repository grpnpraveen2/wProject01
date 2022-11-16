class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed


    private 
    def not_found(e)
        render json: {"Error"=>"record not found","Mesage":e}, status: :unprocessable_entity
        end
        def not_destroyed(e)
        render json: {"Error"=>"record not destroyed","Mesage":e}, status: :unprocessable_entity
        end
end
