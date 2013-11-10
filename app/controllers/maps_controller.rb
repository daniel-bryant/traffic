class MapsController < ApplicationController
  before_action :signed_in_user, only: [:update]
  before_action :correct_user,   only: [:update]

  def update
    @map = Map.find(params[:id])
    if @map.update_attributes(map_params)
      flash[:success] = "Map updated"
      redirect_to current_user
    else
      flash[:error] = "Error, please try again"
      redirect_to current_user
    end
  end

  private

    def map_params
      params.require(:map).permit(:lat, :lon, :zoom, :traffic, :weather)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      redirect_to(root_url) unless current_user.map_id.to_s == params[:id].to_s
    end
end
