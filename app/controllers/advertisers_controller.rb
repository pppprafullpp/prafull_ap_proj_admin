class AdvertisersController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only=>[:destroy]

  def destroy
    Advertiser.find(params[:id]).destroy
     render :json => {
      success:true
    }
  end

end
