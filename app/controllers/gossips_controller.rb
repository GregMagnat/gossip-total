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

end      