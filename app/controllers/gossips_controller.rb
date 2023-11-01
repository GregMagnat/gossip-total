class GossipsController < ApplicationController

    def index 
        @gossips = Gossip.all
    end

    def create
        @gossip = Gossip.new(gossip_params.merge(user: User.first))

        if @gossip.save
          flash[:success] = 'Ton potin est enregistré coco !'
        redirect_to root_path
      else
          render 'nouveau'
      end
    end
      
    private

    def gossip_params
       params.require(:gossip).permit(:title, :content)
    end

    def show
       @gossip = Gossip.find(params[:id])
    end

    def edit
      @gossip = Gossip.find(params[:id])
    end

    def update
      @gossip = Gossip.find(params[:id])
      post_params = params.require(:gossip).permit(title, :content)
      @gossip.update(post_params)
      redirect_to gossips_path
    end

end      