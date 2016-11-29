class AdminsController < ApplicationController

  def manage_user
    @breadcrumb = {'Dashboard' => root_url, 'Manager User' => ''}
  end

  def ad_review
    @breadcrumb = {'Dashboard' => root_url, 'Ad Review' => ''}
    @advertisements = Advertisement.all.paginate(:page=>params[:page],:per_page=>10)
  end

  def reported_ads
    @breadcrumb = {'Dashboard' => root_url, 'Reported Ads' => ''}
  end

  def notification
    @breadcrumb = {'Dashboard' => root_url, 'Notification' => ''}
  end

  def social_accounts
    @breadcrumb = {'Dashboard' => root_url, 'Social Accounts' => ''}
    @social_accounts = SocialAccount.all.paginate(:page => params[:page], :per_page=>10)
  end

  def app_configurations
    @breadcrumb = {'Dashboard' => root_url, 'App configurations' => ''}
    @app_configurations = AppConfiguration.all
    @update_social_data = AppConfiguration.find_by(:config_key=>"update_social_data").config_value
  end

end
