class AdvertisementsController < ApplicationController

   def approve_ads
    Advertisement.find(params[:id]).update_attributes(:status=>Advertisement::STATUS["Approved by Admin"])
    # render :json => {
    #   :success=>1
    # }
    flash[:success] = "Updated"
    redirect_to :back
  end

  def decline_ads
    Advertisement.find(params[:id]).update_attributes(:status=>Advertisement::STATUS["Declined by Admin"])
    # render :json => {
    #   :success=>1
    # }
    flash[:success] = "Updated"
    redirect_to :back
  end
end
