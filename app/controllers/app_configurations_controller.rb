class AppConfigurationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def update
    byebug
    AppConfiguration.find_by(:config_key=>params[:config_key]).update_attributes(:config_value=>params[:config_value])
    if params[:config_key] == "update_social_data"
      system "whenever --update-crontab"
    end
    render :json => {
      success:true
    }
  end

end
