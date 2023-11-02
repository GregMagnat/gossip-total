class CitysController < ApplicationController
    def show
      @user = City.find(params[:id])
    end
  end
  