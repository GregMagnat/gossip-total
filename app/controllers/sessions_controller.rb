class SessionsController < ApplicationController
    def new
      # Cette méthode affiche simplement la vue du formulaire de connexion (new.html.erb)
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to session_path(user.id)
      else
        flash.now[:danger] = 'Mauvaise combine babouim'
        render 'new'
      end
    end
  
    def destroy
      session.delete(:user_id)
      flash[:success] = "A plus bolosse"
      redirect_to new_session_path
    end
  
    before_action :authenticate_user, only: [:index]
  
    def index
      # on code quelque chose qui permet d'afficher le dashboard de l'utilisateur
    end
  
    private
  
    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
  end
  