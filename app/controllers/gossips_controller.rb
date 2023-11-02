class GossipsController < ApplicationController

 before_action :require_login, only: [:new, :create]

    def index 
        @gossips = Gossip.all
    end

    def create
      @gossip = Gossip.create(gossip_params)
      @gossip.user = User.find_by(id: session[:user_id])
      if @gossip.save
        flash[:success] = "Potin bien créé !"
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      @gossip = Gossip.find(params[:id])
    end 

    private

    def gossip_params
       params.require(:gossip).permit(:title, :content)
    end

    def require_login
      unless current_user
        flash[:danger] = "Vous devez être connecté pour créer un potin."
        redirect_to new_session_path
      end
    end
end      