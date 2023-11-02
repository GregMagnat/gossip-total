class ApplicationController < ActionController::Base

    include SessionsHelper

    def contact
    end

    def team
    end

    def home
        @gossips = Gossip.all
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
    
      def require_login
        unless current_user
          flash[:error] = "Mauvaise combine banane"
          redirect_to sessions_path
        end
      end

end
