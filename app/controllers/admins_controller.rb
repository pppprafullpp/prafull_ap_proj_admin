class AdminsController < ApplicationController

  before_filter :verify_authenticity_token, :except=> [:get_notifications]

  def manage_influencer
    @influencers = Influencer.all.paginate(:page => params[:page],:per_page => 10)
    @breadcrumb = {'Dashboard' => root_url, 'Manager Influencer' => ''}
  end

  def manage_advertiser
    @advertisers = Advertiser.all.paginate(:page => params[:page],:per_page => 10)
    @breadcrumb = {'Dashboard' => root_url, 'Manager Advertiser' => ''}
  end


  def ad_review
    # raise params.to_yaml
    params[:search] = {} unless params[:search].present?
    @breadcrumb = {'Dashboard' => root_url, 'Ad Review' => ''}
    @advertisements = Advertisement.search(params[:search]).order("Id DESC").paginate(:page=>params[:page],:per_page=>10)
  end

  def reported_ads
    @breadcrumb = {'Dashboard' => root_url, 'Reported Ads' => ''}
    @reported_ads = Advertisement.where("status in (?)",[4,5]).order("ID DESC").paginate(:page=>params[:page],:per_page=>10)
  end

  def newsletter

  end

  def social_accounts
    @breadcrumb = {'Dashboard' => root_url, 'Social Accounts' => ''}
    @social_accounts = SocialAccount.all.paginate(:page => params[:page], :per_page=>10)
  end

  def app_configurations
    @breadcrumb = {'Dashboard' => root_url, 'App configurations' => ''}
    @app_configurations = AppConfiguration.all
    @update_social_data = AppConfiguration.find_by(:config_key=>"update_social_data").config_value
    @facebook_token = AppConfiguration.find_by(:config_key=>"facebook_access_token").config_value
  end

  def reset_password
    eval(params[:type].titleize).find(params[:id]).update_attributes(:encrypted_password=>"$2a$08$5Qx/TFCUPgSngTDPDrNG/OxxgPQj7wFN5Dm4y/cW7Vw.Cj/HJUET6")
    flash[:success] = "changed"
    render :json => {
      success:true
    }
  end

  def get_notifications
    notifications = Notification.where(:viewed=>false).order("Id DESC").pluck(:activity_type,:activity)
    render :json => {
      success:true,
      notifications: notifications
    }
    notifications
  end

end
