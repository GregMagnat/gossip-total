class GossipsController < ApplicationController

    def index 
        @gossips = Gossip.all
    end

    def create
        @gossip = Gossip.new(gossip_params.merge(user: User.first))

        if @gossip.save
          flash[:success] = 'The super potin was successfully saved!'
        redirect_to root_path
      else
          render 'new'
      end
    end
      
    private

    def gossip_params
       params.require(:gossip).permit(:title, :content)
    end
end      