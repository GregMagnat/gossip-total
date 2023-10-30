class ApplicationController < ActionController::Base
    def contact
    end

    def team
    end

    def home
        @gossips = Gossip.all
    end


end
