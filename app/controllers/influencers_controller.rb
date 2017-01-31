class InfluencersController < ApplicationController
  AC_TYPES = {"SAVING"=>1,"CURRENT"=>2}

  skip_before_filter :verify_authenticity_token, :only=>[:destroy]
  def destroy
    Influencer.find(params[:id]).destroy
     render :json => {
      success:true
    }
  end

  def index
    @breadcrumb = {'Dashboard' => root_url, 'Influencer Details' => ''}
    @influencer_data = Influencer.find(params[:id])
    @financial_info = Influencer.find(params[:id]).influencer_financial_info
  end

end
